import 'package:chat_app/models/response_model.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/user_services.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel {
  static Future<ResponseModel> signUp(
      String email, String password, String name) async {
    FirebaseUser user = await AuthServices.signUp(email, password);

    if (user != null) {
      await UserServices.createOrUpdateUser(email, name: name);
      Preferences.signIn(email, password, "");
      return ResponseModel("Sign up is success", success: true);
    } else {
      return ResponseModel("Sign up is failed");
    }
  }
}
