import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/utils/app_config.dart';

import 'widgets/car_details_bottombar.dart';
import 'widgets/car_specification_widget.dart';

class CarDetailsScreen extends StatelessWidget with AllControllers {
  CarDetailsScreen({Key? key, required this.carId}) : super(key: key);
  final String carId;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 0.1,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('vehicles')
                .doc(carId)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.data!.exists) {
                return const Text("Car details not available at this moment");
              }
              return ListView(
                shrinkWrap: true,
                children: [
                  // const VerticalSpace(height: 5),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          child: ListTile(
                            // leading: const CircleAvatar(
                            //   backgroundColor: Colors.black87,
                            //   backgroundImage: NetworkImage(toyotaLogo),
                            //   radius: 25,
                            // ),
                            title: Text(
                              snapshot.data!['carName'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              snapshot.data!['modelYear'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                            trailing: Icon(
                              Icons.star,
                              color: themeColorSecondary,
                            ),
                          ),
                        ),
                        // const VerticalSpace(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                snapshot.data!['carImage'],
                              ),
                              height: height * 35,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpace(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Specifications",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  CarSpecificationWidget(
                      advancedPaymentAmount:
                          snapshot.data!['advancedPaymentAmount'],
                      height: height,
                      width: width),

                  const VerticalSpace(height: 15),
                ],
              );
            }),
        bottomNavigationBar: CarDetailsBottombar(width: width, carId: carId));
  }
}
