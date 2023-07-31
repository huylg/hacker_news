import 'package:flutter/material.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/story/story_page.dart';
import 'package:hacker_news/timeago.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.story,
    this.onChange,
  });

  final Story story;

  final ValueChanged<Story>? onChange;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => StoryPage(story: story))),
        title: Text(story.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            story.time == null
                ? Text(story.by)
                : Text(
                    '${story.by} - ${timeago(DateTime.fromMillisecondsSinceEpoch(story.time! * 1000))}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${story.score} points | ${story.descendants} comments',
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        final newStory =
                            story.copyWith(isFavorite: !story.isFavorite);

                        final repository = Provider.of<BookmarksRepository>(
                            context,
                            listen: false);

                        final _ = switch (newStory.isFavorite) {
                          true => repository.bookmark(newStory),
                          false => repository.unbookmark(newStory.id),
                        }
                            .ignore();

                        onChange?.call(newStory);
                      },
                      icon: Icon(story.isFavorite
                          ? Icons.bookmark
                          : Icons.bookmark_outline),
                    ),
                    IconButton(
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                                  height: 150,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        TextButton(
                                            child: const Text('Share via'),
                                            onPressed: () => Share.share(
                                                'https://news.ycombinator.com/item?id=${story.id}')),
                                        TextButton(
                                          child: const Text('Open HN link'),
                                          onPressed: () => launchUrlString(
                                            'https://news.ycombinator.com/item?id=${story.id}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                        icon: const Icon(Icons.more_horiz)),
                  ],
                )
              ],
            ),
          ],
        ),
        isThreeLine: true,
      );
}
