class FirestoreFailure implements Exception {
  final String message;

  const FirestoreFailure([this.message = 'Something went wrong.']);

  /// Factory method to generate user-friendly error messages based on Firestore error codes.
  factory FirestoreFailure.fromCode(String code) {
    switch (code) {
      case 'aborted':
        return const FirestoreFailure(
            'Operation was interrupted. Please try again.');
      case 'already-exists':
        return const FirestoreFailure('This data already exists.');
      case 'cancelled':
        return const FirestoreFailure('Operation was canceled.');
      case 'data-loss':
        return const FirestoreFailure('Some data was lost. Please try again.');
      case 'deadline-exceeded':
        return const FirestoreFailure(
            'This is taking too long. Please try again.');
      case 'failed-precondition':
        return const FirestoreFailure(
            'The request cannot be processed right now. Please check and try again.');
      case 'internal':
        return const FirestoreFailure(
            'An internal error occurred. Please try again.');
      case 'invalid-argument':
        return const FirestoreFailure(
            'Invalid data provided. Please check and try again.');
      case 'not-found':
        return const FirestoreFailure(
            'The data you are looking for does not exist.');
      case 'ok':
        return const FirestoreFailure('Operation was successful.');
      case 'out-of-range':
        return const FirestoreFailure('Request is outside the allowed range.');
      case 'permission-denied':
        return const FirestoreFailure(
            'You do not have permission to perform this action.');
      case 'resource-exhausted':
        return const FirestoreFailure(
            'The system is overloaded. Please try again later.');
      case 'unauthenticated':
        return const FirestoreFailure(
            'You are not logged in. Please log in and try again.');
      case 'unavailable':
        return const FirestoreFailure(
            'The service is currently unavailable. Please try again later.');
      case 'unimplemented':
        return const FirestoreFailure('This feature is not supported.');
      case 'unknown':
        return const FirestoreFailure(
            'An unknown error occurred. Please try again.');
      default:
        return const FirestoreFailure(
            'Something went wrong. Please try again.');
    }
  }
}
