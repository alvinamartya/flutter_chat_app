import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> signIn(String email, String name, String image) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
    pref.setString("name", name);
    pref.setString("image", image);
    pref.setBool("login", true);
  }

  static Future<void> signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", "");
    pref.setString("name", "");
    pref.setString("image", "");
    pref.setBool("login", false);
  }

  static void setImage(String image) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("image", image);
  }

  static Future<String> getImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("image");
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("email");
  }
}
