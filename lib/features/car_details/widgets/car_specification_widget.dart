import 'package:flutter/material.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class CarSpecificationWidget extends StatelessWidget {
  CarSpecificationWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.advancedPaymentAmount,
  }) : super(key: key);
  dynamic advancedPaymentAmount;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 17,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 5),
            width: width * 35,
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(20)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.paid,
                size: 40,
                color: screenbackgroundColor,
              ),
              Text(
                "$advancedPaymentAmount taka",
                style: TextStyle(
                  color: screenbackgroundColor,
                ),
              ),
            ]),
          );
        },
        separatorBuilder: (c, i) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
