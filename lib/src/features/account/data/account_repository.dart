import 'package:either_dart/either.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waddle_app/src/utils/exception.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/utils/network_status.dart';
import 'package:waddle_app/src/features/account/model/app_user.dart';

class AccountRepository {
  final FirebaseFirestore _firestore;
  AccountRepository(this._firestore);

  static const String collectionUsers = 'users';
  static const String userCreated = 'isUserCreated';
  static const String userName = 'userName';

  Future<Either<String, AppUser>> createUser(
      AppUser user, WidgetRef ref) async {
    // Check for internet connectivity
    if (!await networkStatus()) {
      return Left(
        'No internet connection. Please connect to the internet and try again.'
            .hardcoded,
      );
    }

    try {
      return await _createUserInFirestore(user, ref).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return Left('Connection timed out. Please try again'.hardcoded);
        },
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromCode(e.code).message);
    } catch (e) {
      return Left('An unexpected error occurred: $e'.hardcoded);
    }
  }

  // Helper function to handle the user creation process
  Future<Either<String, AppUser>> _createUserInFirestore(
      AppUser user, WidgetRef ref) async {
    // Add user data to Firestore (without the id)
    DocumentReference docRef =
        await _firestore.collection(collectionUsers).add(user.toMap());

    // Retrieve the document ID and update the user object
    user.id = docRef.id;

    // Update the user document with the new id field
    await _firestore
        .collection(collectionUsers)
        .doc(user.id)
        .update({'id': user.id});

    // Store user creation status locally
    await _storeUserCreationStatus(user.name);

    ref.invalidate(userNameProvider);

    // Return the updated user with the document ID assigned
    return Right(user);
  }

  Future<void> _storeUserCreationStatus(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userCreated, true);
    await prefs.setString(userName, name);
  }

  Future<bool> isUserCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userCreated) ?? false;
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName) ?? '';
  }
}

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(FirebaseFirestore.instance);
});

final userStatusProvider = FutureProvider<bool>((ref) async {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return await accountRepository.isUserCreated();
});

final userNameProvider = FutureProvider<String>((ref) async {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return accountRepository.getUserName();
});
