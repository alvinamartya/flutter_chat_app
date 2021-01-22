import 'package:chat_app/models/response_model.dart';
import 'package:chat_app/viewmodel/sign_up_view_model.dart';
import 'package:chat_app/views/pages/main_page.dart';
import 'package:chat_app/views/widgets/custom_dialog_widget.dart';
import 'package:chat_app/views/widgets/custom_text_field_widget.dart';
import 'package:chat_app/views/widgets/custome_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  ProgressDialog pr;

  CustomDialog _getDismissDialog(String message) => CustomDialog(
        context,
        "Sign Up",
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

  Widget _getSignUpUi() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ButtonTheme(
                      minWidth: 5,
                      padding: EdgeInsets.all(0),
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.5),
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  CustomTextField(
                      controller: _nameController,
                      labelText: "Name",
                      hintText: "Type your name",
                      obscureText: false),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: _emailController,
                      labelText: "Email",
                      hintText: "Type your email",
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: _passwordController,
                      labelText: "Password",
                      hintText: "Type your password",
                      obscureText: true),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: "Type the confirm password",
                      obscureText: true),
                  SizedBox(
                    height: 40,
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
                            else if (_nameController.text == "")
                              // name is empty
                              _getDismissDialog("Name must be filled").show();
                            else if (_passwordController.text == "")
                              // password is empty
                              _getDismissDialog("Password must be filled")
                                  .show();
                            else if (_confirmPasswordController.text == "")
                              // confirm password is empty
                              _getDismissDialog(
                                      "Confirm password must be filled")
                                  .show();
                            else if (_passwordController.text !=
                                _confirmPasswordController.text)
                              // password is not same with confirm password
                              _getDismissDialog(
                                  "Password and confirm password is not same");
                            else {
                              pr.show();
                              ResponseModel response =
                                  await SignUpViewModel.signUp(
                                      _emailController.text,
                                      _passwordController.text,
                                      _nameController.text);

                              if (!response.success) {
                                // failed
                                pr.hide().then((value) {
                                  print("show error message");
                                  _getDismissDialog(response.message).show();
                                });
                              } else {
                                // success
                                pr.hide().then((value) {
                                  Get.off(MainPage(),
                                      transition:
                                          Transition.rightToLeftWithFade);
                                });
                              }
                            }
                          },
                          text: "Sign Up",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

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
        body: _getSignUpUi());
  }
}
