import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static void signIn(String email, String name, String image) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
    pref.setString("name", name);
    pref.setString("image", image);
    pref.setBool("login", true);
  }

  static Future<String> getImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("image");
  }

  static Future<bool> getLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("login");
  }

  static Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("name");
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("email");
  }
}
