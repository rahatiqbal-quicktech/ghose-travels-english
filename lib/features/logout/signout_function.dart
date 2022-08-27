import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/login/login_screen.dart';

Future<void> signOut() async {
  EasyLoading.show();
  try {
    await FirebaseAuth.instance.signOut().then((value) {
      clearSavedUserData();
      EasyLoading.dismiss();
      Get.offAll(() => LoginScreen());
    });
  } on FirebaseAuthException catch (e) {
    debugPrint(e.message);
    EasyLoading.dismiss();
  }
}

clearSavedUserData() {
  final box = GetStorage();

  box.remove(GetStorageKeys().userIdKey);
  box.remove(GetStorageKeys().userDisplayNameKey);
  box.remove(GetStorageKeys().userEmailKey);
}
