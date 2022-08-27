import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/functions/get_initial_data.dart';
import 'package:ghosh_travels/common/functions/get_user_id.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ghosh_travels/features/home/uber_home_screen.dart';
import 'package:ghosh_travels/features/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    var box = GetStorage();
    // userId = box.read(GetStorageKeys().userIdKey);
    // log("This is user id $userId");

    Future.delayed(const Duration(seconds: 2), () async {
      if (box.read(GetStorageKeys().userIdKey) == null) {
        Get.to(() => LoginScreen());
      } else {
        GetInitialData().getInitialData();
        Get.off(() => const BottomNavigationBarWidget());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage('assets/logos/logo.png'),
          height: height * 20,
        ),
      ),
    );
  }
}
