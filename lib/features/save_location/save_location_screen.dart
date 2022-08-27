import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/save_location/service/save_location_service.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class SaveLocationScreen extends StatelessWidget {
  SaveLocationScreen({Key? key}) : super(key: key);
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                const VerticalSpace(height: 15),
                const Text("Save a location and find it later"),
                const VerticalSpace(height: 15),
                TextFormField(
                  maxLines: 5,
                  controller: locationController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    // border: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // borderSide: BorderSide.none,
                    ),
                    hintText: "Location",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Type a location and save";
                    }

                    return null;
                  },
                ),
                const VerticalSpace(height: 10),
                RoundButtonWidget(
                    labelText: "Save",
                    backgroundColor: themeColor,
                    icon: Icons.save,
                    function: () {
                      // log(locationController.text);
                      if (locationController.text.isEmpty) {
                        return Fluttertoast.showToast(
                          msg: "Type your location to save",
                          gravity: ToastGravity.TOP,
                        );
                      }

                      SaveLocationService()
                          .saveLocation(locationController.text);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
