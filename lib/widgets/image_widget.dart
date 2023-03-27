import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Image_Widget extends StatelessWidget {
  final String url;
  final double size;
  const Image_Widget({super.key, required this.url, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                url,
              ),
              fit: BoxFit.cover)),
    );
  }
}