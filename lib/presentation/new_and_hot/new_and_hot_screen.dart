// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: Text('New & hot',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Container(
                height: 10,
                width: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
            bottom: TabBar(
                labelColor: kblack,
                unselectedLabelColor: kwhite,
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Comming Soon',
                  ),
                  Tab(
                    text: '😍 Everyones Watching',
                  )
                ]),
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            _buildCommingSoon(context),
            _buildEveryonesWatching(),
          ]),
        ),
      ),
    );
  }

  Widget _buildCommingSoon(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => CommingSoonWidget(),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => EveryonesWatchingWidget(),
    );
  }
}
