import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          height: 25,
          width: 30,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
  }
}
