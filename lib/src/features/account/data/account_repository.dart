import 'package:either_dart/either.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waddle_app/src/utils/exception.dart';
import 'package:waddle_app/src/utils/network_status.dart';
import 'package:waddle_app/src/features/account/model/app_user.dart';

class AccountRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<String, AppUser>> createUser(AppUser user) async {
    // Check for internet connectivity
    if (!await networkStatus()) {
      return const Left(
        'No internet connection. Please connect to the internet and try again.',
      );
    }
    try {
      // Attempt to add user data to Firestore (without the id)
      DocumentReference docRef =
          await _firestore.collection('users').add(user.toMap());

      // Retrieve the document ID and update the user object
      user.id = docRef.id;

      // Store user creation status locally
      await _storeUserCreationStatus();

      // Return the updated user with the document ID assigned
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromCode(e.code).message);
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }

  Future<void> _storeUserCreationStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserCreated', true);
  }

  Future<bool> isUserCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isUserCreated') ?? false;
  }
}
