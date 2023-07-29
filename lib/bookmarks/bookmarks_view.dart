import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/stories/story_item.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: bookmarksRepository.bookmarksFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.requireData.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No bookmarks yet',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Your bookmarks will appear here'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return ListView(
                children: snapshot.requireData.map(StoryItem.new).toList());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
