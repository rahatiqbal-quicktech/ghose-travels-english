import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/features/login/login_screen.dart';

class ForgotPasswordService {
  Future sendPasswordRecoveryEmail(String mail) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: mail)
          .then((value) {
        Fluttertoast.showToast(
            msg:
                "A password recovery mail has been sent to your email address. Please check your email.");
        EasyLoading.dismiss();
        Get.off(() => LoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
