import 'package:ghosh_travels/common/controllers/all_controllers.dart';

class GetInitialData with AllControllers {
  getInitialData() {
    campaignsController.getCampaigns();
    purchaseHistoryController.getList();
    profileController.getProfileInfo();
  }
}
