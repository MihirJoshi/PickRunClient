import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';

// ignore: camel_case_types
class Button_Widget extends StatelessWidget {
  final String text;
  // ignore: non_constant_identifier_names
  final double btn_width;
  final Function()? pressed;
  const Button_Widget(
      {Key? key,
      required this.text,
      // ignore: non_constant_identifier_names
      required this.btn_width,
      required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: AppColors.circlecolor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(Dimensions.left20, Dimensions.top15,
            Dimensions.right20, Dimensions.bottom15),
        minWidth: btn_width,
        onPressed: pressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: Dimensions.font20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
