import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/theme_color_textformfield.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/forgot_password/service/forgot_password_service.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            shrinkWrap: true,
            children: [
              const VerticalSpace(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              VerticalSpace(height: height * 5),
              Text("Ghose Travels",
                  style: TextStyle(
                    color: themeColor,
                  )),
              const VerticalSpace(height: 5),
              const Text("পাসওয়ার্ড ভুলে গেছেন?",
                  style: TextStyle(
                    fontSize: 30,
                  )),
              const VerticalSpace(height: 20),
              const Text(
                  " আপনার ইমেইলটি দিন। ইমেইলে একটি পাসওয়ার্ড রিকভারি মেইল পাঠানো হবে। ইমেইলের লিংকটি ফলো করুন।"),
              const VerticalSpace(height: 30),
              ThemeColorTextFormField(
                  textEditingController: mailController,
                  icondata: Icons.email_outlined,
                  hint: "ইমেইল"),
              const VerticalSpace(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: RoundButtonWidget(
                    labelText: "Continue",
                    backgroundColor: themeColor,
                    icon: Icons.verified,
                    function: () {
                      ForgotPasswordService()
                          .sendPasswordRecoveryEmail(mailController.text);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
