import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/vehicles_and_brands/brand_vehicles_screen.dart';

import 'widgets/vehicles_listtile.dart';

class VehiclesAndBrandsScreen extends StatelessWidget {
  const VehiclesAndBrandsScreen({Key? key, required this.brandOf})
      : super(key: key);
  final String brandOf;

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            const VerticalSpace(height: 5),
            const Text(
              "Brands",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const VerticalSpace(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('brands')
                  .where("brandOf", isEqualTo: brandOf)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CupertinoActivityIndicator();
                } else if (!snapshot.hasData) {
                  return const CupertinoActivityIndicator();
                }
                if (snapshot.data?.docs.length == 0) {
                  return ListTile(
                    title: Text("No brand availabe for $brandOf"),
                  );
                }
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => BrandVehiclesScreen(
                                  brandId: snapshot.data!.docs[index].id,
                                ));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Image(
                                image: NetworkImage(
                                  // doc.data().toString().contains('id') ? doc.get('id') : ''
                                  snapshot.data?.docs[index]["image"],
                                ),
                                height: 50,
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
            const VerticalSpace(height: 20),
            const Text(
              "Available Cars",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const VerticalSpace(height: 15),
            // ListView.separated(
            //   shrinkWrap: true,
            //   primary: false,
            //   itemCount: 10,
            //   itemBuilder: (c, i) {
            //     return VehiclesListTile(

            //       i: i, height: height, width: width);
            //   },
            //   separatorBuilder: (c, i) {
            //     return const SizedBox(
            //       height: 20,
            //     );
            //   },
            // )
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("vehicles").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const CupertinoActivityIndicator();
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
          ],
        ),
      ),
    );
  }
}
