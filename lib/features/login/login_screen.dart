import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/get_storage_keys.dart';
import 'package:ghosh_travels/common/widgets/horizontal_space.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/theme_color_textformfield.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/forgot_password/forgot_password_screen.dart';
import 'package:ghosh_travels/features/login/service/sign_in_service.dart';
import 'package:ghosh_travels/features/registration/create_account_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AllControllers {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    // var width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HorizontalSpace(width: double.infinity),
            VerticalSpace(height: height * 17),
            Image(
              image: const AssetImage('assets/logos/logo.png'),
              height: height * 20,
            ),
            VerticalSpace(height: height * 5),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 15, bottom: 10),
                // height: height * 46,
                decoration: BoxDecoration(
                  color: const Color(0xffb07b35).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  // shrinkWrap: true,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ThemeColorTextFormField(
                        textEditingController: emailController,
                        hint: "ইমেইল",
                        icondata: Icons.email_outlined),
                    const VerticalSpace(height: 10),
                    ThemeColorTextFormField(
                      textEditingController: passwordController,
                      hint: "পাসওয়ার্ড",
                      icondata: Icons.password,
                    ),
                    const VerticalSpace(height: 10),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: RoundButtonWidget(
                        labelText: "লগইন",
                        backgroundColor: Colors.black87,
                        icon: Icons.check,
                        function: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "আপনার ইমেইল এবং পাসওয়ার্ড দিন");
                          } else {
                            SignInService().signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RoundButtonWidget(
                        labelText: "একাউন্ট তৈরী করুন",
                        backgroundColor: themeColor,
                        icon: Icons.plus_one,
                        function: () {
                          Get.to(() => CreateAccountScreen());
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPasswordScreen());
                      },
                      child: const Text("পাসওয়ার্ড ভুলে গেছেন?"),
                      style: TextButton.styleFrom(
                        primary: Colors.black54,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
