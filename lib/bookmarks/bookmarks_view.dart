import 'package:flutter/material.dart';
import 'package:hacker_news/bookmarks/bookmark_list_view.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:provider/provider.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: context.read<BookmarksRepository>().bookmarksFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BookmarkListView(stories: snapshot.requireData);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
