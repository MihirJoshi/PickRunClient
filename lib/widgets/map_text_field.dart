import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: camel_case_types, must_be_immutable
class MapTextField extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final text;
  TextEditingController control;
  final String? Function(String?)? valid;
  // ignore: non_constant_identifier_names
  MapTextField({super.key, required this.text, required this.valid, required this.control});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 35),
            child: SmallText(text: text, weight: FontWeight.w800, color: Colors.grey, size: 16,),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: TextFormField(
            autofocus: false,
            
            validator: valid,
            controller: control,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(width: 1.0, color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
           
          ),
        ),
      ],
    );
  }
}
