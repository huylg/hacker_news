import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/stories_top_repository.dart';
import 'package:hacker_news/stories/stories_top_list_view.dart';

class StoriesTopView extends StatelessWidget {
  const StoriesTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storiesTopRepository.fetchTopStories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StoriesTopListView(snapshot.requireData);
        } else if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
