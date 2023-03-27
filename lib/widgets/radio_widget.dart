import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: camel_case_types
class Radio_Widget extends StatefulWidget {
  final String item;
  final String val;
  final String cat;
  final Function(String?)? change;
  // ignore: prefer_const_constructors_in_immutables
  Radio_Widget({super.key, required this.item, required this.change, required this.val, required this.cat});

  @override
  State<Radio_Widget> createState() => _Radio_WidgetState();
}

// ignore: camel_case_types
class _Radio_WidgetState extends State<Radio_Widget> {
  String? category;
  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2.0, 2.0),
                                color: AppColors.shadow)
                          ]),
                      height: 50,
                      width: 500,
                      child: RadioListTile(
                        title: SmallText(text: widget.item, size: 20, color: Colors.black,),
                        value: widget.val,
                        groupValue: widget.cat,
                        onChanged: widget.change,
                      ),
                    );
  }
}