import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/intro/info_page_2.dart';
import 'package:pickrun_new_client_app/intro/info_page_3.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/info_widget.dart';

// ignore: camel_case_types
class Info_Page_1 extends StatefulWidget {
  const Info_Page_1({Key? key}) : super(key: key);

  @override
  State<Info_Page_1> createState() => _Info_Page_1State();
}

// ignore: camel_case_types
class _Info_Page_1State extends State<Info_Page_1> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: AppColors.infoback,
        body: Column(
          children: [
           SizedBox(height: Dimensions.height60 + Dimensions.height40,),
            Info_Widget(
              head_text: "Pickrun is a Delivery",
              head_text2: "Service",
              text: "We deliver documents, food,\nelectronics and much more...",
              c1: AppColors.iconcolor1,
              imageProvider: const DecorationImage(
                  image: NetworkImage("https://media.istockphoto.com/id/1136971542/vector/fast-delivery-boy-character-flat-style-design-vector-illustration-delivery-boy-with-the-box.jpg?s=170667a&w=0&k=20&c=LUbePHQ9x1knHU9-5Moq8srJ6__lrld6eFGinShinhg=")),
              onSkip: ()  {
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Info_Page_3()));
              },
              onNext: ()  {
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Info_Page_2()));
              },
            ),
          ],
        ));
  }
}
