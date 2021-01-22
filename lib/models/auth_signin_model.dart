import 'package:firebase_auth/firebase_auth.dart';

class AuthSignInModel {
  final FirebaseUser user;
  final bool success;
  final String message;

  AuthSignInModel(this.success, this.message, this.user);
}
