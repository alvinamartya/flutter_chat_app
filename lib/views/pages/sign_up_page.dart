import 'package:chat_app/views/widgets/custom_text_field_widget.dart';
import 'package:chat_app/views/widgets/custome_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: ListView(
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
                            onPressed: () {},
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
      ),
    );
  }
}
