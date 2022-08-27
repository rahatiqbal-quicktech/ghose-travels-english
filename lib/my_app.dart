import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ghosh_travels/features/profile/my_profile_screen.dart';
import 'package:ghosh_travels/features/splash_screen/splash_screen.dart';
import 'package:ghosh_travels/temp.dart';

class MyApp extends StatelessWidget with AllControllers {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    campaignsController.getCampaigns();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.1,
              fontSizeDelta: 1.0,
            ),
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
