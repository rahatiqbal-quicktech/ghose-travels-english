import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ghosh_travels/features/profile/service/get_user_data.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;
  var uid = "".obs;

  getProfileInfo() async {
    // log(userCredential.toString());

    final box = GetStorage();

    var temp = await GetUserData().getUseData();

    if (temp != null) {
      var data = temp.data();

      name.value = data!['name'] ?? "Name not available";
      email.value = data['email'] ?? "Email not available";
      phoneNumber.value = data['phone'] ?? "Phone number not found";
    }
    uid.value = box.read(GetStorageKeys().userIdKey);

    Get.to(() => const BottomNavigationBarWidget());
  }
}
