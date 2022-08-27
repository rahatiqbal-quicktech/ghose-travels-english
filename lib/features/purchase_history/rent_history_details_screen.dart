import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class RentHistoryDetailsScreen extends StatelessWidget {
  const RentHistoryDetailsScreen({Key? key, required this.docId})
      : super(key: key);

  final String docId;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    // var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rent Details",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            )),
        backgroundColor: Colors.grey.shade200,
        elevation: 0.1,
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('bookings')
                .doc(docId)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: themeColor,
                ));
              }
              if (!snapshot.data!.exists) {
                return const Text(
                    "Booking details not available at this moment");
              }
              var data = snapshot.data;
              Timestamp timestamp = data!['bookingDate'];
              DateTime dateTime = timestamp.toDate();
              return ListView(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      height: height * 15,
                      decoration: BoxDecoration(
                          color: themeColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            snapshot.data!['vehicleName'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                              "rented on ${dateTime.day}/${dateTime.month}/${dateTime.year}"),
                          // trailing: Image(image: NetworkImage(carPhoto)),
                        ),
                      )),
                  const VerticalSpace(height: 10),
                  ListTile(
                    title: Text("Car Model : ${data['vehicleName']}"),
                    leading: const Icon(Icons.car_rental),
                    minLeadingWidth: 0,
                  ),
                  Divider(color: themeColor, endIndent: 10, indent: 10),
                  ListTile(
                    title: Text(
                        "Rental Date : ${dateTime.day}/${dateTime.month}/${dateTime.year}"),
                    leading: const Icon(Icons.abc),
                    minLeadingWidth: 0,
                  ),
                  // Divider(color: themeColor, endIndent: 10, indent: 10),
                  // const ListTile(
                  //   title: Text("From : Tongi"),
                  //   leading: Icon(Icons.location_city),
                  //   minLeadingWidth: 0,
                  // ),
                  Divider(color: themeColor, endIndent: 10, indent: 10),
                  ListTile(
                    title: Text("To : ${data['destination']}"),
                    leading: const Icon(Icons.location_history),
                    minLeadingWidth: 0,
                  ),
                  Divider(color: themeColor, endIndent: 10, indent: 10),
                  ListTile(
                    title: Text("Pick up : ${data['pickUpAddress']}"),
                    leading: const Icon(Icons.location_city),
                    minLeadingWidth: 0,
                  ),
                  Divider(color: themeColor, endIndent: 10, indent: 10),
                  ListTile(
                    title: Text("Mobile : ${data['customerPhone']}"),
                    leading: const Icon(Icons.phone),
                    minLeadingWidth: 0,
                  ),
                  Divider(color: themeColor, endIndent: 10, indent: 10),
                  ListTile(
                    title: Text("Email : ${data['customerEmail']}"),
                    leading: const Icon(Icons.mail),
                    minLeadingWidth: 0,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
