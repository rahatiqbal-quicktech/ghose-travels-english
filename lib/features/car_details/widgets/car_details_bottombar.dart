import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/features/book_vehicle/book_vehicle_form_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class CarDetailsBottombar extends StatelessWidget with AllControllers {
  CarDetailsBottombar({
    Key? key,
    required this.width,
    required this.carId,
  }) : super(key: key);

  final double width;
  final String carId;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('vehicles')
              .doc(carId)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            }
            return BottomAppBar(
              color: screenbackgroundColor,
              elevation: 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Advanced Payment : ৳ ${snapshot.data!['advancedPaymentAmount']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        bookingVehicleController.getVehicleInfo(
                            carId, snapshot.data!['carName']);
                        Get.to(() => const BookVehicleFormScreen());
                      },
                      child: Container(
                        height: 40,
                        width: width * 30,
                        decoration: BoxDecoration(
                          color: themeColorSecondary,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                            child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }
}
