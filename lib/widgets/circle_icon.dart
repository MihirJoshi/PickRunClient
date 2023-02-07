import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';

// ignore: camel_case_types, must_be_immutable
class Circle_Widget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Color c1_color;
  // ignore: non_constant_identifier_names
  Color c2_color;
  // ignore: non_constant_identifier_names
  Color c3_color;
  // ignore: non_constant_identifier_names
  Circle_Widget({super.key, this.c1_color = Colors.black45, this.c2_color = Colors.black45, this.c3_color = Colors.black45});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
                Icons.circle_sharp,
                size: Dimensions.iconSize20,
                color: c1_color,
              ),
              SizedBox(width: Dimensions.width25),
              Icon(
                Icons.circle_sharp,
                size: Dimensions.iconSize20,
                color: c2_color,
              ),
              SizedBox(width: Dimensions.width25),
              Icon(
                Icons.circle_sharp,
                size: Dimensions.iconSize20,
                color: c3_color,
              ),
      ],
    );
  }
}