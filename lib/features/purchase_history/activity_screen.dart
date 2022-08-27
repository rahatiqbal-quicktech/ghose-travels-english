import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/purchase_history/rent_history_details_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with AllControllers {
  @override
  void initState() {
    super.initState();
    purchaseHistoryController.getList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const VerticalSpace(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: themeColorSecondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: themeColor,
                    ),
                    title: const Text("History"),
                  ),
                ),
                const VerticalSpace(height: 10),
                // Container(
                //   height: height * 10,
                //   decoration: BoxDecoration(
                //       color: themeColor,
                //       borderRadius: BorderRadius.circular(10)),
                // ),
                Obx(() {
                  return ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: purchaseHistoryController.purchaseList.length,
                    itemBuilder: (context, index) {
                      Timestamp temp = purchaseHistoryController
                          .purchaseList[index]['bookingDate'];

                      DateTime dateTime = temp.toDate();

                      return GestureDetector(
                        onTap: () {
                          log(purchaseHistoryController
                              .purchaseListDocIds[index]);
                          Get.to(() => RentHistoryDetailsScreen(
                                docId: purchaseHistoryController
                                    .purchaseListDocIds[index],
                              ));
                        },
                        child: Container(
                          height: height * 15,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                purchaseHistoryController.purchaseList[index]
                                    ['vehicleName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                  "${dateTime.day}/${dateTime.month}/${dateTime.year}  |  To: ${purchaseHistoryController.purchaseList[index]['destination']}"),
                              // trailing: Image(image: NetworkImage(carPhoto)),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (c, i) {
                      return const VerticalSpace(height: 10);
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
