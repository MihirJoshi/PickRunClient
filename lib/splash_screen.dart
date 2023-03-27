import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/intro/info_page_1.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Info_Page_1())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[ 
          Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: 260,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/edited_header.png"),
                )),
              ),
              Center(
                child: SizedBox(
                  height: Dimensions.height300 + Dimensions.height300,
                  child: Image.asset("assets/new_logo.png"),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height300 + Dimensions.height60 + Dimensions.height40),
                  child: const Text("Welcome To PickRun",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
          )
        ],
      ),
    );
  }
}
