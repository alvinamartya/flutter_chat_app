import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static CollectionReference userCollection =
      Firestore.instance.collection("users");

  static Future<DocumentSnapshot> getUsers(String email) async {
    return await userCollection.document(email).get();
  }

  static Future<void> createOrUpdateUser(String email,
      {String name, String imageUrl}) async {
    if (imageUrl == null)
      await userCollection.document(email).setData({"name": name}, merge: true);
    else if (name == null)
      await userCollection
          .document(email)
          .setData({"image": imageUrl}, merge: true);
  }

  static Future<String> uploadImage(File imageFile) async {
    try {
      String fileName = basename(imageFile.path);

      StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask task = ref.putFile(imageFile);
      StorageTaskSnapshot snapshot = await task.onComplete;

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
