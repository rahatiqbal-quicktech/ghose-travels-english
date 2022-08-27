import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/vehicles_and_brands/vehicles_and_brands_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class VehicleTypesWidget extends StatelessWidget {
  const VehicleTypesWidget({
    Key? key,
    required this.icon,
    required this.categoryName,
    required this.width,
    required this.brandVehicleType,
  }) : super(key: key);

  final double width;
  final IconData icon;
  final String categoryName;
  final String brandVehicleType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => VehiclesAndBrandsScreen(
              brandOf: brandVehicleType,
            ));
      },
      child: Container(
        height: 100,
        width: width * 21,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/car_image.jpg'),
            Icon(
              icon,
              size: width * 10,
              color: Colors.grey.shade700,
            ),
            const VerticalSpace(height: 10),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
