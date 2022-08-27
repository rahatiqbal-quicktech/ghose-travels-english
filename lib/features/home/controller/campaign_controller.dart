import 'dart:developer';

import 'package:get/get.dart';
import 'package:ghosh_travels/features/home/service/campaigns_service.dart';

class CampaignsController extends GetxController {
  var list = <Map<String, dynamic>>[].obs;

  getCampaigns() async {
    var temp = await CampaignService().getCampaigns();

    if (temp != null) {
      list.clear();
      for (int i = 0; i < temp.length; i++) {
        list.add(temp[i].data());
      }
    }
    log(list.toString());
    // log(list[0]["campaignImage"].toString());
  }
}
