import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/router.dart';

class MyBottomNavigationbar extends StatelessWidget {
  const MyBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        currentIndex: switch (
            GoRouter.of(context).routerDelegate.currentConfiguration.fullPath) {
          '/' => 0,
          '/bookmarks' => 1,
          '/more' => 2,
          _ => throw Exception('Unknown path'),
        },
        onTap: (value) => switch (value) {
          0 => const TopStoriesRoute().go(context),
          1 => const BookmarksRoute().go(context),
          2 => const MoreRoute().go(context),
          _ => throw Exception('Unknown index'),
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      );
}
