// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_clone/application/search/search_bloc.dart';
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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text('Error while getting Data'));
              } else if (state.idealList.isEmpty) {
                return const Center(child: Text('List is Empty!'));
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idealList[index];
                  return TopSearchItemTile(
                    title: movie.title ?? 'No title Provided',
                    imageUrl: '$imageAppentUrl${movie.posterPath}',
                  );
                },
                separatorBuilder: (context, index) => kheight20,
                itemCount: state.idealList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
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
