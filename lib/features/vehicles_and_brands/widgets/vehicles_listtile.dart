import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/features/car_details/car_details_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class VehiclesListTile extends StatelessWidget {
  const VehiclesListTile({
    Key? key,
    required this.vehicleName,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.carId,
  }) : super(key: key);
  final String vehicleName;
  final String imageUrl;
  final String? carId;
  // final dynamic rent;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 25,
      padding: const EdgeInsets.only(top: 5, left: 10, right: 0, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: NetworkImage(imageUrl),
                // image: NetworkImage(i.isEven ? carImageUrl : carPhoto),
                height: height * 15,
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                        text: vehicleName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: '2020',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ])),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              // RichText(
              //     text: TextSpan(
              //         text: rent.toString(),
              //         style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black,
              //         ),
              //         children: const [
              //       TextSpan(
              //         text: '/hr',
              //         style: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ])),
              GestureDetector(
                onTap: () {
                  Get.to(() => CarDetailsScreen(
                        carId: carId!,
                      ));
                },
                child: Container(
                  height: 52,
                  width: width * 40,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10))),
                  child: const Center(
                      child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
