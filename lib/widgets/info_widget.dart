// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/circle_icon.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';
import 'big_text.dart';

// ignore: must_be_immutable
class Info_Widget extends StatelessWidget {
  final DecorationImage imageProvider;
  final String head_text;
  String head_text2;
  final String text;
  String text2;
  Color c1;
  Color c2;
  Color c3;
  void Function()? onSkip;
  void Function()? onNext;

  Info_Widget(
      {Key? key,
      required this.head_text,
      this.head_text2 = "",
      required this.text,
      this.text2 = "",
      required this.imageProvider,
      required this.onSkip,
      required this.onNext,
      this.c1 = Colors.black45,
      this.c2 = Colors.black45,
      this.c3 = Colors.black45,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.only(top: Dimensions.top200),
            height: Dimensions.height380,
            decoration: BoxDecoration(image: imageProvider),
          ),
        ),
        SizedBox(height: Dimensions.height10),
        Center(
            child: BigText(
          text: head_text,
          size: 24,
        )),
        SizedBox(height: Dimensions.height5),
        Center(
            child: BigText(
          text: head_text2,
          size: 24,
        )),
        SizedBox(height: Dimensions.height40),
        SmallText(
          text: text,
          size: 16,
          weight: FontWeight.w500,
          color: Colors.black,
        ),
        SizedBox(height: Dimensions.height2),
        
        SizedBox(height: Dimensions.height60),
        Container(
          padding: EdgeInsets.only(left: Dimensions.left10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: onSkip,
                  child: SmallText(
                    text: "Skip",
                    color: Colors.grey,
                   
                    size: Dimensions.font18,
                  )),
              SizedBox(width: Dimensions.width50),
              Circle_Widget(c1_color: c1, c2_color: c2, c3_color: c3,),
              SizedBox(width: Dimensions.width50),
              GestureDetector(
                  onTap: onNext,
                  child: SmallText(
                    text: "Next",
                    color: Colors.blueAccent,
                 
                    size: Dimensions.font18,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
