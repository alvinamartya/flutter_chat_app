import 'package:chat_app/models/response_model.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/user_services.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInViewModel {
  static Future<ResponseModel> signIn(String email, String password) async {
    FirebaseUser user = await AuthServices.signIn(email, password);
    if (user != null) {
      DocumentSnapshot snapshot = await UserServices.getUsers(email);
      Preferences.signIn(email, snapshot.data["name"],
          snapshot.data["image"] == null ? "" : snapshot.data["image"]);

      return ResponseModel("Sign in is success", success: true);
    } else {
      return ResponseModel("Incorrect either username or password");
    }
  }
}
