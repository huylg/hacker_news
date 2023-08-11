import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/html_metadata_repository.dart';
import 'package:hacker_news/story/story_page.dart';
import 'package:hacker_news/timeago.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoryItem extends StatefulWidget {
  const StoryItem({
    super.key,
    required this.story,
    this.onChange,
  });

  final Story story;

  final ValueChanged<Story>? onChange;

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  late final _future = context
      .read<HtmlMetadataRepository>()
      .getHtmlMetadata(widget.story.url ?? '');

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StoryPage(story: widget.story))),
        title: FutureBuilder(
          future: _future,
          builder: (context, snapshot) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (snapshot.hasData)
                CachedNetworkImage(
                    imageUrl: snapshot.requireData, fit: BoxFit.fitWidth),
              Text(widget.story.title),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.story.time == null
                ? Text(widget.story.by)
                : Text(
                    '${widget.story.by} - ${timeago(DateTime.fromMillisecondsSinceEpoch(widget.story.time! * 1000))}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.story.score} points | ${widget.story.descendants} comments',
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        final newStory = widget.story
                            .copyWith(isFavorite: !widget.story.isFavorite);

                        final repository = Provider.of<BookmarksRepository>(
                            context,
                            listen: false);

                        final _ = switch (newStory.isFavorite) {
                          true => repository.bookmark(newStory),
                          false => repository.unbookmark(newStory.id),
                        }
                            .ignore();

                        widget.onChange?.call(newStory);
                      },
                      icon: Icon(widget.story.isFavorite
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
                                                'https://news.ycombinator.com/item?id=${widget.story.id}')),
                                        TextButton(
                                          child: const Text('Open HN link'),
                                          onPressed: () => launchUrlString(
                                            'https://news.ycombinator.com/item?id=${widget.story.id}',
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
