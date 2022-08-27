import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/abcde.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/theme_color_textformfield.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/edit_profile/service/edit_profile_service.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with AllControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = profileController.name.value;
    emailController.text = profileController.email.value;
    phoneController.text = profileController.phoneNumber.value;
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height / 100;
    // var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: abcde(title: "Edit Profile"),
      body: SafeArea(
          child: ListView(
        children: [
          const VerticalSpace(height: 10),
          // Container(
          //   height: 100,
          //   width: 100,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: themeColor.withOpacity(0.5),
          //   ),
          //   child: const Center(
          //     child: Icon(Icons.image),
          //   ),
          // ),
          // const VerticalSpace(height: 5),
          // const Center(
          //     child: Text(
          //   "Tap to change profile picture",
          //   style: TextStyle(
          //     fontSize: 11,
          //   ),
          // )),
          // const VerticalSpace(height: 5),
          const ListTile(
            title: Text("Personal Info"),
          ),
          // const VerticalSpace(height: 5),
          ListTile(
            title: ThemeColorTextFormField(
              icondata: Icons.abc,
              hint: "Jagadish Chandra Bashu",
              textEditingController: nameController,
            ),
            tileColor: themeColor.withOpacity(0.1),
          ),
          ListTile(
            title: ThemeColorTextFormField(
              icondata: Icons.call,
              hint: "+8801245",
              textEditingController: phoneController,
            ),
            tileColor: themeColor.withOpacity(0.1),
          ),
          ListTile(
            title: ThemeColorTextFormField(
                icondata: Icons.email,
                hint: "email@gmail.com",
                textEditingController: emailController),
            tileColor: themeColor.withOpacity(0.1),
          ),
          const VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: RoundButtonWidget(
                  labelText: "Save",
                  backgroundColor: themeColor,
                  icon: Icons.save,
                  function: () {
                    EditProfileService().updateProfile(
                        email: emailController.text,
                        name: nameController.text,
                        phone: phoneController.text);
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: RoundButtonWidget(
                  labelText: "Cancel",
                  backgroundColor: Colors.grey,
                  icon: Icons.cancel,
                  function: () {
                    Get.back();
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
