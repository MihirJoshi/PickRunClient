import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/pages/login_page.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/otp_genrate.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: camel_case_types
class Direction_Page extends StatelessWidget {
  const Direction_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            
             const SizedBox(height: 100,),
             SmallText(text: "Select option for further proceed", size: 18, weight: FontWeight.bold, color: Colors.black,),
             const SizedBox(height: 60,),
             Button_Widget(text: "Login", btn_width: 280, pressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
             }),
             const SizedBox(height: 50,),
             Button_Widget(text: "OTP Verify", btn_width: 280, pressed: (){
              
             })
          ],
        ),
      ),
    );
  }
}