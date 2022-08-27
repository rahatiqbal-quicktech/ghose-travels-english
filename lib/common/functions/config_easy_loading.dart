import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ghosh_travels/utils/app_config.dart';

configEasyLoading() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = themeColor;
}
