import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';

class GetUserData {
  Future<DocumentSnapshot<Map<String, dynamic>>?> getUseData() async {
    EasyLoading.show();
    try {
      final box = GetStorage();
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(box.read(GetStorageKeys().userIdKey))
          .get();

      // var data = snapshot.data();
      EasyLoading.dismiss();
      return snapshot;
    } on Exception catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
      return null;
    }
  }
}
