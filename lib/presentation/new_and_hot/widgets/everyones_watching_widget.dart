// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text('Friends',
            style: TextStyle(
                fontSize: 18, color: kwhite, fontWeight: FontWeight.bold)),
        kheight,
        Text(
            "Lorem Ipsum is simply dummy text of the printing and ndard incn an unknownntereci, but also the leof Lorem Ipsum.",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
        kheight,
        kheight,
        kheight,
        kheight,
        VideoWidget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                iconSize: 25, textSize: 16, text: 'Share', icon: Icons.share),
            kwidth,
            kwidth,
            CustomButtonWidget(
                iconSize: 25, textSize: 16, text: 'My List', icon: Icons.add),
            kwidth,
            kwidth,
            CustomButtonWidget(
                iconSize: 25,
                textSize: 16,
                text: 'Play',
                icon: Icons.play_arrow),
            kwidth,
          ],
        )
      ],
    );
  }
}
