import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static void signIn(String email, String name, String image) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
    pref.setString("name", name);
    pref.setString("image", image);
    pref.setBool("login", true);
  }
}
