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

  static const String _collectionUsers = 'users';
  static const String _userCreated = 'isUserCreated';
  static const String _userName = 'userName';

  Future<Either<String, AppUser>> createUser(AppUser user) async {
    // Check for internet connectivity
    if (!await networkStatus()) {
      return Left(
        'No internet connection. Please connect to the internet and try again.'
            .hardcoded,
      );
    }

    try {
      return await _createUserInFirestore(user).timeout(
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
  Future<Either<String, AppUser>> _createUserInFirestore(AppUser user) async {
    // Add user data to Firestore (without the id)
    DocumentReference docRef =
        await _firestore.collection(_collectionUsers).add(user.toMap());

    // Retrieve the document ID and update the user object
    user.id = docRef.id;

    // Update the user document with the new id field
    await _firestore
        .collection(_collectionUsers)
        .doc(user.id)
        .update({'id': user.id});

    // Store user creation status locally
    await _storeUserCreationStatus(user.name);

    // Return the updated user with the document ID assigned
    return Right(user);
  }

  Future<void> _storeUserCreationStatus(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_userCreated, true);
    await prefs.setString(_userName, name);
  }

  Future<bool> isUserCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userCreated) ?? false;
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName) ?? '';
  }
}

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(FirebaseFirestore.instance);
});

final userStatusProvider = FutureProvider<bool>((ref) async {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return await accountRepository.isUserCreated();
});
