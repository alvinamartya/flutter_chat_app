import 'dart:io';

import 'package:chat_app/views/widgets/custom_flat_icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color _signOutColor = Color(0xFFFFBFBF);
  final Color _signOutTextColor = Color(0xFFEE7A7A);

  AccountPage(this.name, this.imageUrl);

  Future<PickedFile> _getImage() async {
    return await ImagePicker().getImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SizedBox.expand(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                      fontFamily: "Oswald",
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[400],
                        backgroundImage: AssetImage("assets/person.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 26,
                      child: GestureDetector(
                        onTap: () async {
                          PickedFile pickedFile = await _getImage();
                          // File file = File(pickedFile.path);
                        },
                        child: CustomFlatIconCircle(
                          Colors.black,
                          Colors.grey[300],
                          Icons.camera_alt,
                          40,
                          40,
                          15,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            ButtonTheme(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.all(0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            CustomFlatIconCircle(Colors.white, _signOutColor,
                                Icons.power_settings_new, 25, 25, 15),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: _signOutTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
