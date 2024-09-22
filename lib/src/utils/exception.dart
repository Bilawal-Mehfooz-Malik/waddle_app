class SignUpWithNameAndPasswordFailure implements Exception {
  const SignUpWithNameAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  factory SignUpWithNameAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithNameAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithNameAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithNameAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithNameAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithNameAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithNameAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}
