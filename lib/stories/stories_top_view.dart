import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/top_story_repository.dart';
import 'package:hacker_news/stories/stories_list_view.dart';
import 'package:provider/provider.dart';

class StoriesTopView extends StatefulWidget {
  const StoriesTopView({super.key});

  @override
  State<StoriesTopView> createState() => _StoriesTopViewState();
}

class _StoriesTopViewState extends State<StoriesTopView>
    with AutomaticKeepAliveClientMixin<StoriesTopView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final repository = context.read<TopStoryRepository>();
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
