import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/theme_color_textformfield.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/registration/service/sign_up_service.dart';
import 'package:ghosh_travels/utils/app_config.dart';

import '../../common/widgets/round_button_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height / 100;
    // var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              const VerticalSpace(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const VerticalSpace(height: 40),
              const Text(
                "আপনার একাউন্ট তৈরী করুন",
                style: TextStyle(fontSize: 20),
              ),
              const VerticalSpace(height: 20),
              ThemeColorTextFormField(
                textEditingController: nameController,
                hint: "নাম",
                icondata: Icons.abc,
                validationMessage: "নাম দেয়া আবশ্যক",
              ),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                textEditingController: emailController,
                hint: "ইমেইল",
                icondata: Icons.email,
                validationMessage: "ইমেইল দেয়া আবশ্যক",
              ),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                textEditingController: phoneController,
                hint: "ফোন নাম্বার",
                icondata: Icons.phone,
              ),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                textEditingController: passwordController,
                hint: "পাসওয়ার্ড",
                icondata: Icons.password,
                hideText: true,
              ),
              // const VerticalSpace(height: 10),
              // ThemeColorTextFormField(
              //     textEditingController: confirmPasswordController,
              //     confirmPasswordField: true,
              //     password: passwordController.text,
              //     hint: "Confirm password",
              //     icondata: Icons.remove_red_eye_sharp),
              const VerticalSpace(height: 15),
              SizedBox(
                width: double.infinity,
                child: RoundButtonWidget(
                  labelText: "একাউন্ট তৈরী করুন",
                  backgroundColor: themeColor,
                  icon: Icons.edit,
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      SignUpService().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                    }

                    // Get.to(() => CreateAccountScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
