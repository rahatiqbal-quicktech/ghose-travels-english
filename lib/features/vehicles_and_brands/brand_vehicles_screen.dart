import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/utils/app_config.dart';

import 'widgets/vehicles_listtile.dart';

class BrandVehiclesScreen extends StatelessWidget {
  const BrandVehiclesScreen({Key? key, required this.brandId})
      : super(key: key);
  final String brandId;

  @override
  Widget build(BuildContext context) {
    CollectionReference brands =
        FirebaseFirestore.instance.collection('brands');

    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black87,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: brands.doc(brandId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const CupertinoActivityIndicator();
            }

            return ListView(
              shrinkWrap: true,
              children: [
                // const VerticalSpace(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: themeColorSecondary,
                    // borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text("Cars from ${snapshot.data!['name']}"),
                    subtitle:
                        Text("List of cars from ${snapshot.data!['name']}"),
                    trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                            image: NetworkImage(snapshot.data!['image']))),
                  ),
                ),
                const VerticalSpace(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("vehicles")
                        .where("brandId", isEqualTo: brandId)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const CupertinoActivityIndicator();
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            "No cars available from this brand right now",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (c, i) {
                          return VehiclesListTile(
                              vehicleName: snapshot.data?.docs[i]["carName"],
                              imageUrl: snapshot.data?.docs[i]["carImage"],
                              carId: snapshot.data?.docs[i].id,
                              height: height,
                              width: width);
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      );
                    },
                  ),
                ),
                const VerticalSpace(height: 15),
              ],
            );
          }),
    );
  }
}
