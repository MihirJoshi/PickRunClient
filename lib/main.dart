import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/home_page.dart';
import 'package:pickrun_new_client_app/pages/item_select.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/map_ui.dart';
import 'package:pickrun_new_client_app/pages/order_summary.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/pickup.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/place_auto_complete.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/splash_screen.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/utils/dimensions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

