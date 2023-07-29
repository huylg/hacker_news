import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hacker_news/models/stories_pagination.dart';
import 'package:hacker_news/repositories/stories_top_repository.dart';
import 'package:hacker_news/stories/story_item.dart';

class StoriesTopListView extends StatefulWidget {
  const StoriesTopListView(this.data, {super.key});

  final StoriesPagination data;

  @override
  State<StoriesTopListView> createState() => _StoriesTopListViewState();
}

class _StoriesTopListViewState extends State<StoriesTopListView> {
  Future<void>? _loadmore;
  late StoriesPagination _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    final stories = _data.stories;
    return RefreshIndicator(
      onRefresh: () => storiesTopRepository
          .refetchTopStories()
          .then((value) => setState(() => _data = value)),
      child: Scrollbar(
        child: ListView.separated(
          itemCount: min(stories.length + 1, _data.total),
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            if (index == stories.length) {
              _loadmore ??= storiesTopRepository
                  .fetchMoreTopStories(_data)
                  .then((value) => setState(() => _data = value))
                  .whenComplete(() => _loadmore = null);
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return StoryItem(stories[index]);
          },
        ),
      ),
    );
  }
}
