import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.iconSize = 30,
    this.textSize = 18,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
