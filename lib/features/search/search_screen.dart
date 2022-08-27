import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/search/search_result_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

import 'widgets/selected_search_category_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AllControllers {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.setSelectedItemNumber(number: 0, categoryName: "");
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Form(
          key: _formKey,
          child: ListView(
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
              const Text("Select a category"),
              const VerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SelectSearchCategoryItem(
                      itemName: "Cars",
                      icon: Icons.car_rental,
                      selectedNumber: 1,
                      categoryName: "vehicles",
                      width: width),
                  SelectSearchCategoryItem(
                      itemName: "Microbus",
                      icon: Icons.local_taxi,
                      selectedNumber: 2,
                      categoryName: "microBus",
                      width: width),
                  SelectSearchCategoryItem(
                      itemName: "Truck",
                      icon: Icons.local_shipping,
                      selectedNumber: 3,
                      categoryName: "truck",
                      width: width),
                  SelectSearchCategoryItem(
                      itemName: "Bus",
                      icon: Icons.directions_bus,
                      selectedNumber: 4,
                      categoryName: "bus",
                      width: width),
                ],
              ),
              const VerticalSpace(height: 20),
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  contentPadding: const EdgeInsets.all(8.0),
                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter some text to search";
                  }

                  return null;
                },
              ),
              const VerticalSpace(height: 20),
              SizedBox(
                height: 45,
                child: RoundButtonWidget(
                    labelText: "Search",
                    backgroundColor: themeColorSecondary,
                    icon: Icons.search,
                    function: () {
                      if (searchController.selectedItemNumber.value == 0) {
                        Fluttertoast.showToast(
                            msg: "Select a search category first",
                            gravity: ToastGravity.TOP);
                      } else if (_formKey.currentState!.validate()) {
                        Get.to(() => SearchResultScreen(
                            carName: _searchController.text));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
