import 'package:get/get.dart';

class BookingVehicleController extends GetxController {
  var vehicleId = "".obs;
  var vehicleName = "".obs;
  var uid = "".obs;

  getVehicleInfo(id, name) {
    vehicleId.value = id;
    vehicleName.value = name;
  }
}
