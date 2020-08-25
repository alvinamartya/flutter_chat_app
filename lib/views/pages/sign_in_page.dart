import 'dart:ui';
import 'package:chat_app/models/response_model.dart';
import 'package:chat_app/viewmodel/sign_in_view_model.dart';
import 'package:chat_app/views/pages/home_page.dart';
import 'package:chat_app/views/widgets/custom_dialog_widget.dart';
import 'package:chat_app/views/widgets/custom_text_field_widget.dart';
import 'package:chat_app/views/widgets/custome_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:progress_dialog/progress_dialog.dart';
import 'sign_up_page.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ProgressDialog pr;

  CustomDialog _getDismissDialog(String message) => CustomDialog(
        context,
        "Sign In",
        message,
        [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          )
        ],
      );

  Widget _getSignInUi() => Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontFamily: "Oswald",
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Ready to talk?",
                  style: TextStyle(
                      fontFamily: "Oswald",
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  hintText: "Type your email",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  hintText: "Type your password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        isOutline: false,
                        onPressed: () async {
                          if (_emailController.text == "")
                            // email is empty
                            _getDismissDialog("Email must be filled").show();
                          else if (_passwordController.text == "")
                            // password is empty
                            _getDismissDialog("Password must be filled").show();
                          else {
                            pr.show();
                            ResponseModel response =
                                await SignInViewModel.signIn(
                                    _emailController.text,
                                    _passwordController.text);

                            if (!response.success) {
                              // failed
                              pr.hide().then((value) {
                                _getDismissDialog(response.message).show();
                              });
                            } else {
                              // success
                              pr.hide().then((value) {
                                Get.Get.off(HomePage(),
                                    transition:
                                        Get.Transition.rightToLeftWithFade);
                              });
                            }
                          }
                        },
                        text: "Sign In",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Divider(color: Colors.grey, thickness: 0.5),
                      flex: 1,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "OR",
                          style: TextStyle(fontFamily: "Roboto"),
                        )),
                    Flexible(
                      child: Divider(color: Colors.grey, thickness: 0.5),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        isOutline: true,
                        onPressed: () {
                          Get.Get.to(SignUp(),
                              transition: Get.Transition.rightToLeftWithFade);
                          _emailController.clear();
                          _passwordController.clear();
                        },
                        text: "Sign Up",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: _getSignInUi(),
    );
  }
}
