import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/pages/direction_page.dart';
import 'package:pickrun_new_client_app/pages/home_page.dart';

import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

import '../utils/colors.dart';

// ignore: camel_case_types
class Info_Page_3 extends StatefulWidget {
  const Info_Page_3({Key? key}) : super(key: key);

  @override
  State<Info_Page_3> createState() => _Info_Page_3State();
}

// ignore: camel_case_types
class _Info_Page_3State extends State<Info_Page_3> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.infoback,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.infoback,
      body: Column(
        children: [
          Center(
            child: Container(
              //padding: EdgeInsets.only(top: 200),
              height: Dimensions.mainInfo2Height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://png.pngtree.com/png-vector/20220527/ourmid/pngtree-shipment-tracking-delivery-order-route-png-image_4759413.png"))),
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Center(
              child: BigText(
            text: "Pickrun is reliable",
            size: 24,
          )),
          SizedBox(height: Dimensions.height40),
          SmallText(
            text: "    Always track the courier at every\ndelivery stage and solve the problem\n                        with chat.",
            size: 16,
            color: Colors.black,
          ),
          
          SizedBox(height: Dimensions.height60),
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.left10, right: Dimensions.left10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Button_Widget(text: "Get Started", btn_width: 250, pressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Direction_Page()));
              })],
            ),
          ),
        ],
      ),
    );
  }
}
