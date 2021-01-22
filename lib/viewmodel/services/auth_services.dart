import 'package:chat_app/models/auth_signin_model.dart';
import 'package:chat_app/utils/firabase_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> signIn(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password); // sign in with firebase auth
      FirebaseUser user = result.user; // get user
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> singOut() async {
    _auth.signOut();
  }

  static Future<AuthSignInModel> signUp(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password); // create new firebase auth
      FirebaseUser user = result.user; // get user
      return AuthSignInModel(true, "success", user);
    } catch (e) {
      return AuthSignInModel(false, FirebaseError.show(e.code), null);
    }
  }
}
