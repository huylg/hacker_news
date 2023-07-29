import 'package:flutter/material.dart';
import 'package:hacker_news/models/story.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoryItem extends StatelessWidget {
  const StoryItem(
    this.story, {
    super.key,
  });

  final Story story;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(story.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(story.by),
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
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
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
