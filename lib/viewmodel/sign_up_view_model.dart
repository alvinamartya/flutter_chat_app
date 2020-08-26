import 'package:chat_app/models/response_model.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:chat_app/viewmodel/services/auth_services.dart';
import 'package:chat_app/viewmodel/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel {
  static Future<ResponseModel> signUp(
      String email, String password, String name) async {
    FirebaseUser user = await AuthServices.signUp(
        email, password); // create new firebase authentication

    if (user != null) {
      await UserServices.createOrUpdateUser(email,
          name: name); // save data user to firestore
      Preferences.signIn(email, password, ""); // save data user to preferences
      return ResponseModel("Sign up is success", success: true);
    } else {
      return ResponseModel("Sign up is failed");
    }
  }
}
