import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';
import 'package:provider/provider.dart';

import 'stories_list_view.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  late final _future = context.read<StoryRepository>().fetchStories();
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _future,
        builder: (context, snapshot) =>
            switch ((snapshot.hasData, snapshot.hasError)) {
          (true, false) => StoriesListView(data: snapshot.requireData),
          (false, true) => Center(child: Text('Error ${snapshot.error}')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      );
}
