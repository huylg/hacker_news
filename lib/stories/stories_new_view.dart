import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/new_story_repository.dart';
import 'package:hacker_news/stories/stories_list_view.dart';
import 'package:provider/provider.dart';

class StoriesNewView extends StatefulWidget {
  const StoriesNewView({super.key});

  @override
  State<StoriesNewView> createState() => _StoriesNewViewState();
}

class _StoriesNewViewState extends State<StoriesNewView>
    with AutomaticKeepAliveClientMixin<StoriesNewView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final repository = context.read<NewStoryRepository>();

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

  @override
  bool get wantKeepAlive => true;
}
