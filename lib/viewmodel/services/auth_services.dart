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
      print(e.toString());
      return null;
    }
  }

  static Future<void> singOut() async {
    _auth.signOut();
  }

  static Future<FirebaseUser> signUp(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password); // create new firebase auth
      FirebaseUser user = result.user; // get user
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
