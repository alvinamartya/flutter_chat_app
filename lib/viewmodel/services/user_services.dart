import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static CollectionReference userCollection =
      Firestore.instance.collection("users"); // instance users collection

  static Future<DocumentSnapshot> getUsers(String email) async {
    return await userCollection.document(email).get(); // get user
  }

  static Future<void> createOrUpdateUser(String email,
      {String name, String imageUrl}) async {
    if (imageUrl == null)
      await userCollection
          .document(email)
          .setData({"name": name}, merge: true); // save name user to firestore
    else if (name == null)
      await userCollection.document(email).setData({"image": imageUrl},
          merge: true); // save image path to firestore
  }

  static Future<String> uploadImage(File imageFile, String email) async {
    try {
      String fileName = basename(imageFile.path); // get file path

      // save image to firebase storage
      StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask task = ref.putFile(imageFile);
      StorageTaskSnapshot snapshot = await task.onComplete;

      String imagePath = await snapshot.ref
          .getDownloadURL(); // get image path from firebase storage
      await createOrUpdateUser(email,
          imageUrl: imagePath); // save image path to firestore
      return imagePath;
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
