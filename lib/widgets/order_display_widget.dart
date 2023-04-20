import 'package:flutter/material.dart';

class OrderDisplayWidget extends StatelessWidget {
  final String line;
  final String data;
  OrderDisplayWidget({Key? key, required this.line, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 28),
          child:  Align(
            alignment: Alignment.topLeft,
            child: Text(
              line,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 40),
          alignment: Alignment.topLeft,
          child: Text(
            data,
            maxLines: 3,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}