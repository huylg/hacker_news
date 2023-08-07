import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/show_story_repository.dart';
import 'package:hacker_news/stories/stories_list_view.dart';
import 'package:provider/provider.dart';

class StoriesShowView extends StatelessWidget {
  const StoriesShowView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ShowStoryRepository>();
    return FutureBuilder(
      future: repository.fetchStories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StoriesListView(
            data: snapshot.requireData,
            repository: repository,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
