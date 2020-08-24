import 'package:chat_app/views/pages/sign_up_page.dart';
import 'package:chat_app/views/widgets/custom_text_field_widget.dart';
import 'package:chat_app/views/widgets/custome_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: Container(
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
                    obscureText: false),
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
                        onPressed: () {},
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
                          Get.to(SignUp(), transition: Transition.rightToLeft);
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
      ),
    );
  }
}
