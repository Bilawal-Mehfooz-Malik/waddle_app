import 'package:either_dart/either.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waddle_app/src/utils/exception.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/utils/network_status.dart';
import 'package:waddle_app/src/features/account/model/app_user.dart';

class AccountRepository {
  final FirebaseFirestore firestore;
  AccountRepository(this.firestore);

  static const String collectionUsers = 'users';
  static const String userCreated = 'isUserCreated';

  Future<Either<String, AppUser>> createUser(AppUser user) async {
    // Check for internet connectivity
    if (!await networkStatus()) {
      return Left(
        'No internet connection. Please connect to the internet and try again.'
            .hardcoded,
      );
    }
    try {
      // Add user data to Firestore (without the id)
      DocumentReference docRef =
          await firestore.collection(collectionUsers).add(user.toMap());

      // Retrieve the document ID and update the user object
      user.id = docRef.id;

      // Update the user document with the new id field
      await firestore
          .collection(collectionUsers)
          .doc(user.id)
          .update({'id': user.id});

      // Store user creation status locally
      await _storeUserCreationStatus();

      // Return the updated user with the document ID assigned
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromCode(e.code).message);
    } catch (e) {
      return Left('An unexpected error occurred: $e'.hardcoded);
    }
  }

  Future<void> _storeUserCreationStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userCreated, true);
  }

  Future<bool> isUserCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userCreated) ?? false;
  }
}

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(FirebaseFirestore.instance);
});

// FutureProvider to check if the user is created
final userStatusProvider = FutureProvider<bool>((ref) async {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return await accountRepository.isUserCreated();
});
