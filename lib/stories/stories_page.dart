import 'package:flutter/material.dart';
import 'package:hacker_news/my_bottom_navigation_bar.dart';
import 'package:hacker_news/repositories/stories_top_repository.dart';
import 'package:hacker_news/stories/stories_jobs_view.dart';
import 'package:hacker_news/stories/stories_new_view.dart';
import 'package:hacker_news/stories/stories_show_view.dart';
import 'package:hacker_news/stories/stories_top_view.dart';
import 'package:provider/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: const MyBottomNavigationbar(),
        appBar: AppBar(
          title: const Text('Stories'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Top'),
              Tab(text: 'New'),
              Tab(text: 'Show'),
              Tab(text: 'Ask'),
              Tab(text: 'Jobs'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StoriesTopView(),
            StoriesNewView(),
            StoriesNewView(),
            StoriesShowView(),
            StoriesJobsView(),
          ],
        ),
      ),
    );
  }
}
