import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/bookmarks/bookmarks_page.dart';
import 'package:hacker_news/more/more_page.dart';
import 'package:hacker_news/my_bottom_navigation_bar.dart';
import 'package:hacker_news/stories/stories_ask_view.dart';
import 'package:hacker_news/stories/stories_jobs_view.dart';
import 'package:hacker_news/stories/stories_new_view.dart';
import 'package:hacker_news/stories/stories_show_view.dart';
import 'package:hacker_news/stories/stories_top_view.dart';

part 'router.g.dart';

@TypedGoRoute<TopStoriesRoute>(
  path: '/',
)
class TopStoriesRoute extends GoRouteData {
  const TopStoriesRoute();

  @override
  Widget build(context, state) {
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
            StoriesShowView(),
            StoresAskView(),
            StoriesJobsView(),
          ],
        ),
      ),
    );
  }
}

@TypedGoRoute<BookmarksRoute>(
  path: '/bookmarks',
)
class BookmarksRoute extends GoRouteData {
  const BookmarksRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: BookmarksPage());
}

@TypedGoRoute<MoreRoute>(
  path: '/more',
)
class MoreRoute extends GoRouteData {
  const MoreRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MorePage());
  }
}
