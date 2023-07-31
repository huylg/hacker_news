import 'package:flutter/material.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/stories/story_item.dart';

class BookmarkListView extends StatefulWidget {
  const BookmarkListView({super.key, required this.stories});

  final List<Story> stories;

  @override
  State<BookmarkListView> createState() => _BookmarkListViewState();
}

class _BookmarkListViewState extends State<BookmarkListView> {
  late List<Story> _stories;

  @override
  void initState() {
    super.initState();
    _stories = widget.stories;
  }

  @override
  Widget build(BuildContext context) {
    return _stories.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No bookmarks yet',
                    style: Theme.of(context).textTheme.titleLarge),
                const Text('Your bookmarks will appear here'),
              ],
            ),
          )
        : Scrollbar(
            child: ListView(
              children: _stories
                  .map((story) => StoryItem(
                        story: story,
                        onChange: (value) => setState(() {
                          _stories
                              .removeWhere((element) => element.id == value.id);
                        }),
                      ))
                  .toList(),
            ),
          );
  }
}
