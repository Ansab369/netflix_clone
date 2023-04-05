import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageItem =
        'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/nCzzQKGijVzfGFg42id7uDLOjY5.jpg';
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageItem),
        ),
      ),
    );
  }
}
