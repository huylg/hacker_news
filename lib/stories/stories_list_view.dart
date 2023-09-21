import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hacker_news/models/stories_pagination.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';
import 'package:hacker_news/stories/story_item.dart';
import 'package:provider/provider.dart';

class StoriesListView extends StatefulWidget {
  const StoriesListView({
    super.key,
    required this.data,
  });

  final StoriesPagination data;

  @override
  State<StoriesListView> createState() => _StoriesListViewState();
}

class _StoriesListViewState extends State<StoriesListView> {
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
    final repository = context.read<StoryRepository>();

    return RefreshIndicator(
      onRefresh: () => repository
          .refetchStories()
          .then((value) => setState(() => _data = value)),
      child: Scrollbar(
        child: ListView.separated(
          itemCount: min(stories.length + 1, _data.total),
          separatorBuilder: (context, index) => const Divider(),
          cacheExtent: 1000,
          itemBuilder: (context, index) {
            if (index == stories.length) {
              _loadmore ??= repository
                  .fetchMoreTopStories(_data)
                  .then((value) => setState(() => _data = value))
                  .whenComplete(() => _loadmore = null);
              return const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    )),
              );
            }

            return StoryItem(
              story: stories[index],
              onChange: (story) => setState(() => _data.stories[index] = story),
            );
          },
        ),
      ),
    );
  }
}
