class FirebaseError {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Email is already in use.';
      case 'ERROR_INVALID_EMAIL':
        return 'The email is badly formatted.';
      case 'ERROR_WRONG_PASSWORD':
        return 'Email or password is incorrect.';
      default:
        return 'An error has occurred.';
    }
  }
}
