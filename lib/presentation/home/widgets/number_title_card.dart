import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: 'Top 10 Tv Shows In India Today'),
          kheight,
          LimitedBox(
            maxHeight: 225,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return NumberCardItem(
                  index: index,
                );
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return kwidth;
              },
            ),
          ),
          kheight,
        ],
      ),
    );
  }
}
