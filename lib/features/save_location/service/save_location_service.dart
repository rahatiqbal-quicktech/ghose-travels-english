import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/profile/my_profile_screen.dart';

class SaveLocationService {
  saveLocation(String location) async {
    final box = GetStorage();
    EasyLoading.show();
    CollectionReference reference =
        FirebaseFirestore.instance.collection('savedLocations');
    await reference.add({
      "location": location,
      "userId": box.read(GetStorageKeys().userIdKey),
    }).then((value) {
      // debugPrint(value.toString());
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: "Location saved", toastLength: Toast.LENGTH_LONG);
      Get.off(() => MyProfileScreen());
    }).catchError((e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
          msg: "Something went wrong. Please try again in a while.");
    });
  }
}
