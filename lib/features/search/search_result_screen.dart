import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/car_details/car_details_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key, required this.carName}) : super(key: key);
  final String carName;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen>
    with AllControllers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection(searchController.selectedCategory.value)
              .where("carName", isEqualTo: widget.carName)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data?.docs.length == 0) {
              return Container(
                padding: const EdgeInsets.all(10),
                color: themeColorSecondary.withOpacity(0.45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    ListTile(
                      leading: Icon(
                        Icons.search_off,
                        color: themeColor,
                      ),
                      title: Text(
                        "Searched for \"${widget.carName}\". No vehicle found.",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }
            log(snapshot.toString());
            return ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: themeColorSecondary.withOpacity(0.45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: themeColor,
                          )),
                      ListTile(
                        leading: Icon(
                          Icons.search,
                          color: themeColor,
                        ),
                        title: Text(
                          "Your search result for \"${widget.carName}\"",
                          style: TextStyle(color: themeColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(height: 20),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?.docs[index];
                        return Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ListTile(
                              onTap: () {
                                Get.to(() => CarDetailsScreen(
                                    carId: data!.id.toString()));
                              },
                              leading:
                                  Image(image: NetworkImage(data!['carImage'])),
                              title: Text(data["carName"]),
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }),
    ));
  }
}
