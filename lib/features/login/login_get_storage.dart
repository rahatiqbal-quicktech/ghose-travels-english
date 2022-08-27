import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';

class LoginGetStorage {
  loginGetStorage(UserCredential userCredential) {
    final box = GetStorage();

    box.write(GetStorageKeys().userIdKey, userCredential.user?.uid);
    box.write(
        GetStorageKeys().userDisplayNameKey, userCredential.user?.displayName);
    box.write(GetStorageKeys().userEmailKey, userCredential.user?.email);
    log(box.read(GetStorageKeys().userIdKey));
  }
}
