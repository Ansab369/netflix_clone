import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: [
          kheight,
          kheight,
          const _SmartDownloads(),
          kheight,
          kheight,
          Section2(),
          Section3(),
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
              color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });

    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhite, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'We will download a personalized selection of\nmovies and shows for you, so there is\nalways something to watch on your\ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading || state.downloads!.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.37,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                        ),
                        DownloadsImage(
                          imageList:
                              '$imageAppentUrl${state.downloads![0].posterPath}',
                          margin: const EdgeInsets.only(left: 130, bottom: 50),
                          angle: 20,
                          size: Size(size.width * 0.5, size.width * 0.58),
                        ),
                        DownloadsImage(
                          imageList:
                              '$imageAppentUrl${state.downloads![1].posterPath}',
                          margin: const EdgeInsets.only(right: 130, bottom: 50),
                          angle: -20,
                          size: Size(size.width * 0.5, size.width * 0.58),
                        ),
                        DownloadsImage(
                            imageList:
                                '$imageAppentUrl${state.downloads![2].posterPath}',
                            margin: const EdgeInsets.only(left: 0),
                            size: Size(size.width * 0.59, size.width * 0.65),
                            boderRadious: 60),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.boderRadious = 60,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final double boderRadious;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(boderRadious),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}
