import 'package:chat_app/viewmodel/bloc/sign_in/sign_in_bloc.dart';
import 'package:chat_app/viewmodel/bloc/sign_up/sign_up_bloc.dart';
import 'package:chat_app/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
