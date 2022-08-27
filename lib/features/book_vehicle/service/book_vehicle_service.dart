import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ghosh_travels/features/home/uber_home_screen.dart';

class BookVehicleService with AllControllers {
  bookVehicle({
    required String name,
    required String phone,
    required String email,
    required String pickUpAddress,
    required String destination,
    required DateTime date,
  }) async {
    EasyLoading.show();
    CollectionReference bookingsReference =
        FirebaseFirestore.instance.collection('bookings');
    await bookingsReference.add({
      "customerUid": profileController.uid.value,
      "customerName": name,
      "customerPhone": phone,
      "customerEmail": email,
      "vehicleId": bookingVehicleController.vehicleId.value,
      "vehicleName": bookingVehicleController.vehicleName.value,
      "pickUpAddress": pickUpAddress,
      "destination": destination,
      "bookingDate": date,
    }).then((value) {
      // debugPrint(value.toString());
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: "Your booking has been confirmed",
          toastLength: Toast.LENGTH_LONG);
      Get.offAll(() => const BottomNavigationBarWidget());
    }).catchError((e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
          msg: "Something went wrong. Please try again in a while.");
    });
  }
}
