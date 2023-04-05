// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('FEB',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 6,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              kheight,
              Row(
                children: [
                  Text(
                    'TALLGIRL  2',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                          iconSize: 20,
                          textSize: 11,
                          text: 'Remaint me ',
                          icon: Icons.all_out_sharp),
                      kwidth,
                      CustomButtonWidget(
                          iconSize: 20,
                          textSize: 11,
                          text: 'info',
                          icon: Icons.info_outline),
                      kwidth,
                    ],
                  )
                ],
              ),
              kheight,
              Text('Coming on friday'),
              kheight,
              kheight,
              Text('Tall Girl 2',
                  style: TextStyle(
                      fontSize: 18,
                      color: kwhite,
                      fontWeight: FontWeight.bold)),
              kheight,
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and ndard incn an unknownntereci, but also the leof Lorem Ipsum.",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
