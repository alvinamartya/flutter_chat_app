import 'dart:io';

import 'package:chat_app/utils/shared_preferences.dart';
import 'package:chat_app/viewmodel/account_view_model.dart';
import 'package:chat_app/viewmodel/bloc/user_image/user_image_bloc.dart';
import 'package:chat_app/viewmodel/services/user_services.dart';
import 'package:chat_app/views/pages/sign_in_page.dart';
import 'package:chat_app/views/widgets/custom_flat_icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color _signOutColor = Color(0xFFFFBFBF);
  final Color _signOutTextColor = Color(0xFFEE7A7A);
  ProgressDialog pr;

  Widget _getImageUser(String imageUrl) => Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(125),
          image: DecorationImage(
            image: imageUrl == null
                ? AssetImage("assets/person.png")
                : NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );

  AccountPage(this.name, this.imageUrl);

  Future<PickedFile> _getImage() async {
    return await ImagePicker()
        .getImage(source: ImageSource.gallery); // pick image from gallery
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    UserImageBloc bloc = BlocProvider.of<UserImageBloc>(context);
    pr = ProgressDialog(context);
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
                      width: 250,
                      height: 250,
                      child: BlocBuilder<UserImageBloc, UserImageState>(
                        builder: (context, state) {
                          if (state is UserImageLoaded) {
                            return _getImageUser(state.imagePath);
                          } else {
                            return _getImageUser(null);
                          }
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 40,
                      child: GestureDetector(
                        onTap: () async {
                          String email = await Preferences.getEmail();
                          try {
                            PickedFile pickedFile =
                                await _getImage(); // get picked file
                            File file = File(pickedFile.path); // get file
                            pr.show();
                            String imagePath = await UserServices.uploadImage(
                                file, email); // upload image to database
                            Preferences.setImage(
                                imagePath); // save image to preferences
                            bloc.add(UserImageUploadEvent(imagePath));
                          } catch (e) {
                            print(e.toString());
                            bloc.add(UserImageLoadedEvent());
                          } finally {
                            pr.hide();
                          }
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
                onPressed: () async {
                  await AccountViewModel.signOut();
                  Get.Get.off(SignIn(), transition: Get.Transition.leftToRight);
                },
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
