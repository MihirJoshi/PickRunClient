import 'package:flutter/material.dart';

class OrderTextField extends StatelessWidget {
  final String? Function(String?)? valid;
  final TextEditingController control;
  final TextInputType type;
  final int min;
  final int max;
  final IconData icon;
  final String hint;
  final Color color;
  final Function()? tap;
  OrderTextField({super.key, required this.control, required this.hint, required this.icon, required this.max, required this.min, this.type = TextInputType.text, required this.valid, required this.color, this.tap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: control,
      keyboardType: type,
      autovalidateMode: AutovalidateMode.always,
      minLines: min,
      maxLines: max,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: color,
          ),
          hintText: hint,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
              onTap: tap,
    );
  }
}