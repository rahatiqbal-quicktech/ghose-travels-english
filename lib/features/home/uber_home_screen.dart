import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/save_location/saved_locations_screen.dart';
import 'package:ghosh_travels/features/search/search_screen.dart';
import 'widgets/vehicle_types_widget.dart';

class UberHomeScreen extends StatelessWidget with AllControllers {
  UberHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            // FirestoreSearchBar(
            //   tag: 'example',
            // ),
            const VerticalSpace(height: 15),
            Obx(() {
              return CarouselSlider.builder(
                itemCount: campaignsController.list.length,
                itemBuilder: (BuildContext context, int i, int pageViewIndex) {
                  return Container(
                    height: height * 20,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(
                            campaignsController.list[i]["campaignImage"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: height * 21,
                  // enableInfiniteScroll: false,
                  // enlargeCenterPage: true,
                  viewportFraction: 1,
                ),
              );
            }),
            const VerticalSpace(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VehicleTypesWidget(
                  icon: Icons.car_rental,
                  categoryName: "Car",
                  brandVehicleType: "vehicles",
                  width: width,
                ),
                VehicleTypesWidget(
                  icon: Icons.local_taxi,
                  categoryName: "Microbus",
                  brandVehicleType: "microBus",
                  width: width,
                ),
                VehicleTypesWidget(
                  icon: Icons.local_shipping,
                  categoryName: "Truck",
                  brandVehicleType: "truck",
                  width: width,
                ),
                VehicleTypesWidget(
                  icon: Icons.directions_bus,
                  categoryName: "Bus",
                  brandVehicleType: "bus",
                  width: width,
                ),
              ],
            ),
            const VerticalSpace(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchScreen());
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(
                    left: 10, top: 5, bottom: 5, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade400,
                ),
                child: Row(
                  children: const [
                    Text("Search"),
                    Spacer(),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            // const VerticalSpace(height: 20),
            // TextFormField(
            //   decoration: InputDecoration(
            //     suffixIcon: const Icon(Icons.search),
            //     fillColor: Colors.grey.shade400,
            //     filled: true,
            //     contentPadding: const EdgeInsets.all(8.0),
            //     // border: InputBorder.none,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20.0),
            //       borderSide: BorderSide.none,
            //     ),
            //     hintText: "Search",
            //   ),
            // ),
            const VerticalSpace(height: 20),
            ListTile(
              onTap: () {
                Get.to(() => SavedLocationsScreen());
              },
              leading: const Icon(Icons.location_on),
              title: const Text("Saved Locations"),
              subtitle: const Text("Check all the locations you saved before"),
              trailing: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
