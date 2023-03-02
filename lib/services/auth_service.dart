import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty
          //  || file != null

          ) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await _firestore.collection("users").doc(credential.user!.uid).set({
          "username": username,
          "uid": credential.user!.uid,
          email: email,
          bio: bio,
          "followers": [],
          "following": []
        });
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
