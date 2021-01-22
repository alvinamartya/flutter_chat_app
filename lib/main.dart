import 'package:chat_app/viewmodel/bloc/user_image/user_image_bloc.dart';
import 'package:chat_app/views/pages/main_page.dart';
import 'package:chat_app/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get login state
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool loginState =
      pref.getBool("login") == null ? false : pref.getBool("login");

  // run app
  runApp(MyApp(loginState));
}

class MyApp extends StatelessWidget {
  final bool login;

  MyApp(this.login);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserImageBloc>(
          create: (context) => UserImageBloc()..add(UserImageLoadedEvent()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: (login) ? MainPage() : SignIn(),
      ),
    );
  }
}
