import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class SelectSearchCategoryItem extends StatelessWidget with AllControllers {
  SelectSearchCategoryItem({
    Key? key,
    required this.width,
    required this.selectedNumber,
    required this.categoryName,
    required this.icon,
    required this.itemName,
  }) : super(key: key);

  final double width;
  final int selectedNumber;
  final String categoryName;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          // Get.to(() => VehiclesAndBrandsScreen());
          searchController.setSelectedItemNumber(
              number: selectedNumber, categoryName: categoryName);
        },
        child: Container(
          height: 100,
          width: width * 21,
          decoration: BoxDecoration(
            color: searchController.selectedItemNumber.value == selectedNumber
                ? themeColorSecondary
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/car_image.jpg'),
              Icon(
                icon,
                size: width * 10,
                color:
                    searchController.selectedItemNumber.value == selectedNumber
                        ? themeColor
                        : Colors.grey.shade700,
              ),
              const VerticalSpace(height: 10),
              Text(itemName),
            ],
          ),
        ),
      );
    });
  }
}
