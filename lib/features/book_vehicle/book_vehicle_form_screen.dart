import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghosh_travels/common/controllers/all_controllers.dart';
import 'package:ghosh_travels/common/widgets/round_button_widget.dart';
import 'package:ghosh_travels/common/widgets/theme_color_textformfield.dart';
import 'package:ghosh_travels/common/widgets/vertical_space.dart';
import 'package:ghosh_travels/features/book_vehicle/service/book_vehicle_service.dart';
import 'package:ghosh_travels/utils/app_config.dart';

class BookVehicleFormScreen extends StatefulWidget {
  const BookVehicleFormScreen({Key? key}) : super(key: key);

  @override
  State<BookVehicleFormScreen> createState() => _BookVehicleFormScreenState();
}

class _BookVehicleFormScreenState extends State<BookVehicleFormScreen>
    with AllControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController pickUpAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime now = DateTime.now();
  // DateTime date = new DateTime(now.year, now.month, now.day);

  @override
  void initState() {
    super.initState();
    nameController.text = profileController.name.value;
    emailController.text = profileController.email.value;
    phoneController.text = profileController.phoneNumber.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: screenbackgroundColor,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const VerticalSpace(height: 10),
              const Text("Book your car now"),
              const VerticalSpace(height: 15),
              ThemeColorTextFormField(
                  textEditingController: nameController,
                  icondata: Icons.person,
                  hint: "Name",
                  validationMessage: "Provide your name"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: phoneController,
                  icondata: Icons.dialpad,
                  hint: "Phone Number",
                  validationMessage: "You must add a phone number"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: emailController,
                  icondata: Icons.email,
                  hint: "Email",
                  validationMessage: "Provide your email"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: pickUpAddressController,
                  icondata: Icons.location_city,
                  maxLines: 2,
                  hint: "Pick Up Address",
                  validationMessage: "Provide your pick up address"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: destinationController,
                  icondata: Icons.map,
                  maxLines: 2,
                  hint: "Destination",
                  validationMessage: "Provide your destination"),
              const VerticalSpace(height: 15),
              const Text(
                "Set Booking Date",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.timelapse,
                  color: themeColorSecondary,
                ),
                title: Text(
                  "${now.day} - ${now.month} - ${now.year}",
                ),
                subtitle: const Text("Tap to set new booking date"),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(now.year, now.month, now.day),
                      maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                    debugPrint('change $date');
                  }, onConfirm: (date) {
                    debugPrint('confirm $date');
                    setState(() {
                      now = date;
                    });
                    Fluttertoast.showToast(
                        msg:
                            "Booking date has been set - ${now.day} /${now.month}/${now.year}");
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
              ),
              const VerticalSpace(height: 10),
              RoundButtonWidget(
                  labelText: "Confirm Booking",
                  backgroundColor: themeColor,
                  icon: Icons.check,
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      BookVehicleService().bookVehicle(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          pickUpAddress: pickUpAddressController.text,
                          destination: destinationController.text,
                          date: now);
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
