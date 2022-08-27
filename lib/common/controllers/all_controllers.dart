import 'package:get/get.dart';
import 'package:ghosh_travels/features/book_vehicle/controller/booking_vehicle_controller.dart';
import 'package:ghosh_travels/features/home/controller/campaign_controller.dart';
import 'package:ghosh_travels/features/profile/controller/profile_controller.dart';
import 'package:ghosh_travels/features/purchase_history/controller/purchase_history_controller.dart';
import 'package:ghosh_travels/features/search/controller/search_screen_controller.dart';

class AllControllers {
  final profileController = Get.put(ProfileController());
  final campaignsController = Get.put(CampaignsController());
  final bookingVehicleController = Get.put(BookingVehicleController());
  final purchaseHistoryController = Get.put(PurchaseHistoryController());
  final searchController = Get.put(SearchScreenController());
}
