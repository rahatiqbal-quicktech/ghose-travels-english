import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/features/login/login_screen.dart';

class SignUpService {
  Future signUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          EasyLoading.dismiss();
          await value.user?.updateDisplayName(name);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(value.user?.uid)
              .set({
            'email': value.user?.email,
            'name': name,
            'phone': phone,
            'userId': value.user?.uid,
          });

          Fluttertoast.showToast(
            msg: "Your account is created",
            backgroundColor: Colors.green,
          );
          Get.to(() => LoginScreen());
        },
      );
      // User user = userCredential.user!;
      // user.updateDisplayName("a b c d e");
      // Fluttertoast.showToast(msg: "Signed Up");
      // debugPrint(user.toString());

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.dismiss();
        debugPrint('The password provided is too weak.');
        Fluttertoast.showToast(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.dismiss();
        debugPrint('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: 'The account already exists for that email');
      }
      EasyLoading.dismiss();
    }
  }
}
