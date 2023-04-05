import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/aTjbqMONy77fHJrIYu14g1F0d5h.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top Searches'),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItemTile(),
            separatorBuilder: (context, index) => kheight20,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kwidth,
        const Expanded(
          child: Text(
            'Movie Name Name Name ',
            style: TextStyle(
                color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        kwidth,
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 21,
          child: CircleAvatar(
            backgroundColor: kblack,
            radius: 19,
            child: Icon(
              Icons.play_arrow,
              color: kwhite,
            ),
          ),
        ),
      ],
    );
  }
}
