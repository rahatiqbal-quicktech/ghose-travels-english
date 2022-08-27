import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/abcde.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/edit_profile/edit_profile_screen.dart';
import 'package:ghosh_travels/features/logout/signout_function.dart';
import 'package:ghosh_travels/features/save_location/save_location_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class MyProfileScreen extends StatelessWidget with AllControllers {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: abcde(title: "My Profile"),
        body: Obx(() {
          return ListView(
            children: [
              const VerticalSpace(height: 10),
              // Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: themeColor.withOpacity(0.5),
              //   ),
              //   child: const Center(
              //     child: Icon(Icons.image),
              //   ),
              // ),
              // const VerticalSpace(height: 5),
              ListTile(
                title: const Text("Personal Info"),
                trailing: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => EditProfileScreen(),
                      transition: Transition.noTransition,
                    );
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: themeColor),
                  ),
                ),
              ),
              const VerticalSpace(height: 5),
              ListTile(
                leading: const Icon(Icons.abc),
                title: Text(profileController.name.value),
                tileColor: themeColor.withOpacity(0.1),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(profileController.phoneNumber.value),
                tileColor: themeColor.withOpacity(0.1),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(profileController.email.value),
                tileColor: themeColor.withOpacity(0.1),
              ),
              // const VerticalSpace(height: 10),
              // const ListTile(
              //   title: Text(""),
              // ),
              const VerticalSpace(height: 50),
              ListTile(
                onTap: () {
                  Get.to(() => SaveLocationScreen());
                },
                leading: const Icon(Icons.card_giftcard),
                title: const Text("Save location"),
                tileColor: themeColor.withOpacity(0.1),
              ),
              const VerticalSpace(height: 30),
              ListTile(
                title: const Text("Logout"),
                tileColor: themeColor.withOpacity(0.1),
                textColor: Colors.red,
                onTap: () {
                  signOut();
                },
              )
            ],
          );
        }));
  }
}
