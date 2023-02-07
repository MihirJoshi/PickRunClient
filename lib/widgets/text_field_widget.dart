import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: camel_case_types
class Text_field_widget extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final text;
  final TextEditingController edit_controller;
  final String? Function(String?)? valid;
  final void Function(String?)? saved;
  final TextInputType type;
  // ignore: non_constant_identifier_names
  const Text_field_widget({super.key, required this.text, required this.edit_controller, required this.valid, required this.saved, required this.type});

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
            controller: edit_controller,
            validator: valid,
            onSaved: saved,
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
            keyboardType: type,
          ),
        ),
      ],
    );
  }
}
