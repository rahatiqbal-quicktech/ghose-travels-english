import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/purchase_history/service/purchase_history_service.dart';

class PurchaseHistoryController extends GetxController {
  var purchaseList = <Map<String, dynamic>>[].obs;
  var purchaseListDocIds =
      <String>[].obs; // for saving document id to get purchase details

  getList() async {
    final box = GetStorage();
    // var id = box.read(GetStorageKeys().userIdKey);

    var temp = await PurchaseHistoryService()
        .getPurchaseHistory(uid: box.read(GetStorageKeys().userIdKey));

    if (temp != null) {
      purchaseList.clear();
      for (var i = 0; i < temp.length; i++) {
        purchaseList.add(temp[i].data());
        purchaseListDocIds.add(temp[i].id);
      }
    }
  }
}
