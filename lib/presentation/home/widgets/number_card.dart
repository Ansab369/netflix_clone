// ignore_for_file: prefer_const_constructors

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCardItem extends StatelessWidget {
  const NumberCardItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    const imageItem =
        'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg';
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: 150,
              width: 40,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageItem),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -20,
          child: BorderedText(
            strokeColor: kwhite,
            strokeWidth: 5,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: kblack,
                fontSize: 120,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
