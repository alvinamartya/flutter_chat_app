import 'package:chat_app/views/pages/home_page.dart';
import 'package:chat_app/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(MyApp(
    pref.getBool("login"),
  ));
}

class MyApp extends StatelessWidget {
  final bool login;

  MyApp(this.login);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (login) ? HomePage() : SignIn(),
    );
  }
}
