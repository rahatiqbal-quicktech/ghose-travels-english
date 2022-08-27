import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/functions/get_initial_data.dart';
import 'package:ghosh_travels/features/login/login_get_storage.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class SignInService with AllControllers {
  signIn({required String email, required String password}) async {
    EasyLoading.show();
    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log(value.toString());

        LoginGetStorage().loginGetStorage(value);
        profileController.getProfileInfo();
        GetInitialData().getInitialData();
      });
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.dismiss();
        debugPrint('No user found for that email.');
        Fluttertoast.showToast(msg: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        EasyLoading.dismiss();
        debugPrint('Wrong password provided for that user.');
        Fluttertoast.showToast(
          msg: 'Wrong password',
          backgroundColor: themeColorSecondary,
          gravity: ToastGravity.TOP,
        );
      }
      EasyLoading.dismiss();
    }
  }
}
