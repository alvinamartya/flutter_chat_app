import 'dart:io';

import 'package:chat_app/utils/shared_preferences.dart';
import 'package:chat_app/viewmodel/services/auth_services.dart';
import 'package:chat_app/viewmodel/services/user_services.dart';
import 'package:image_picker/image_picker.dart';

class AccountViewModel {
  static Future<String> uploadImage(String email) async {
    try {
      PickedFile pickedFile = await _getImage(); // get picked file
      File file = File(pickedFile.path); // get file
      String imagePath = await UserServices.uploadImage(
          file, email); // upload image to database
      Preferences.setImage(imagePath); // save image to preferences
      return imagePath;
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  static Future<void> signOut() async {
    await Preferences.signOut();
    await AuthServices.singOut();
  }

  static Future<PickedFile> _getImage() async {
    return await ImagePicker()
        .getImage(source: ImageSource.gallery); // pick image from gallery
  }
}
