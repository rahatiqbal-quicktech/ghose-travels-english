import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class SavedLocationsScreen extends StatelessWidget {
  SavedLocationsScreen({Key? key}) : super(key: key);
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          const ListTile(
            leading: Icon(Icons.maps_home_work),
            title: Text("Saved locations"),
          ),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('savedLocations')
                  .where("userId",
                      isEqualTo: box.read(GetStorageKeys().userIdKey))
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: themeColor,
                  ));
                }
                // if (snapshot.data?.docs.length == 0) {}
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      var data = snapshot.data?.docs[i];
                      return Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: themeColor.withOpacity(0.1),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(data!["location"]),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (c, i) {
                      return const Divider();
                    },
                  ),
                );
              })
        ],
      )),
    );
  }
}
