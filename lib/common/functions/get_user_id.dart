import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';

getUserId() {
  final box = GetStorage();
  var temp = box.read(GetStorageKeys().userIdKey);
  return temp;
}
