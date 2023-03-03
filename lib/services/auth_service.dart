import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/services/storage_service.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);

        String photUrl = await StorageMethods()
            .uploadImageToStorage("profilePictures", file, false);

        await _firestore.collection("users").doc(credential.user!.uid).set({
          "username": username,
          "uid": credential.user!.uid,
          email: email,
          bio: bio,
          "followers": [],
          "following": [],
          "photoUrl": photUrl
        });
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invlid-email") {
        res = "The email is badly formatted";
      } else if (err.code == "weak-password") {
        res = "Password should be at least 6 characters";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
