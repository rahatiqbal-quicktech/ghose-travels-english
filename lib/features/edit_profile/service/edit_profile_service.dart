import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/profile/my_profile_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class EditProfileService with AllControllers {
  //
  updateProfile({
    required String email,
    required String name,
    required String phone,
  }) async {
    EasyLoading.show();
    var box = GetStorage();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(box.read(GetStorageKeys().userIdKey))
          .set({
        'email': email,
        'name': name,
        'phone': phone,
        'userId': box.read(GetStorageKeys().userIdKey),
      }).then((value) {
        EasyLoading.dismiss();
        profileController.getProfileInfo();
        Get.off(() => MyProfileScreen());
        Fluttertoast.showToast(
          msg: "Profile updated",
          backgroundColor: themeColor,
        );
      });
    } on Exception catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
    }
  }
}
