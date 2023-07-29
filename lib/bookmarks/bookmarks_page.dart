import 'package:flutter/material.dart';
import 'package:hacker_news/bookmarks/bookmarks_view.dart';
import 'package:hacker_news/my_bottom_navigation_bar.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationbar(),
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: const BookmarksView(),
    );
  }
}
