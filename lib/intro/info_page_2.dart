import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/intro/info_page_3.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/info_widget.dart';

// ignore: camel_case_types
class Info_Page_2 extends StatefulWidget {
  const Info_Page_2({Key? key}) : super(key: key);

  @override
  State<Info_Page_2> createState() => _Info_Page_2State();
}

// ignore: camel_case_types
class _Info_Page_2State extends State<Info_Page_2> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.infoback,
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
        body: Info_Widget(
          head_text: "Delivery with affordable\n price",
          head_text2: "price",
          text: "Set pickup and destination address and app\n will calculate price according to distance",
          c2: AppColors.iconcolor1,
          imageProvider: const DecorationImage(
              image: NetworkImage("https://img.freepik.com/premium-vector/delivery-man-riding-red-scooter-illustration_9845-14.jpg?w=2000")),
          onSkip: ()  {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Info_Page_3()));
          },
          onNext: ()  {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Info_Page_3()));
          },
        ));
  }
}
