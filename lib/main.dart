import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ghosh_travels/common/functions/config_easy_loading.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configEasyLoading();

  runApp(MyApp());
}
