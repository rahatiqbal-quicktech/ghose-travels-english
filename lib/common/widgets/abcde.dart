import 'package:flutter/material.dart';

AppBar abcde({required String title}) {
  return AppBar(
    backgroundColor: Colors.grey.shade200,
    elevation: 0.1,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    automaticallyImplyLeading: false,

    // leading: leading
    //     ? IconButton(
    //         onPressed: () {
    //           Get.back();
    //         },
    //         icon: const Icon(
    //           Icons.arrow_back_ios,
    //           color: Colors.black,
    //         ))
    //     : Container(),
  );
}
