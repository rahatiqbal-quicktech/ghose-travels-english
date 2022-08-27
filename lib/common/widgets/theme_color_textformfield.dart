import 'package:flutter/material.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class ThemeColorTextFormField extends StatelessWidget {
  const ThemeColorTextFormField({
    Key? key,
    required this.icondata,
    required this.hint,
    this.textEditingController,
    this.validationMessage = 'Please enter some text',
    this.confirmPasswordField = false,
    this.password,
    this.hideText = false,
    this.maxLines = 1,
  }) : super(key: key);

  final IconData icondata;
  final String hint;
  final TextEditingController? textEditingController;
  final String? validationMessage;
  final bool? confirmPasswordField;
  final String? password;
  final bool hideText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: hideText,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icondata,
          color: Colors.black54,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        // contentPadding: const EdgeInsets.only(left: 20),
        contentPadding: const EdgeInsets.all(17),

        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(40),
        //   borderSide: BorderSide(
        //     // color: Colors.white,
        //     color: themeColor.withOpacity(0.3),
        //   ),
        // ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            // color: Colors.white,
            color: themeColor.withOpacity(0.3),
          ),
        ),
      ),
      validator: (value) {
        // if (confirmPasswordField == false) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        // } else {
        //   if (password != textEditingController?.text) {
        //     return 'Password didnt match';
        //   }
        // }

        return null;
      },
    );
  }
}
