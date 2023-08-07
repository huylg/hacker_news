import 'package:flutter/material.dart';
import 'package:hacker_news/comments/comments_list_view.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late Story _story;

  @override
  void initState() {
    super.initState();
    _story = widget.story;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final newStory = _story.copyWith(isFavorite: !_story.isFavorite);

              setState(() {
                _story = newStory;
              });

              final repository = context.read<BookmarksRepository>();

              return switch (newStory.isFavorite) {
                true => repository.bookmark(newStory),
                false => repository.unbookmark(newStory.id),
              }
                  .ignore();
            },
            icon: Icon(
                _story.isFavorite ? Icons.bookmark : Icons.bookmark_outline),
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
      ),
      body: FutureBuilder(
          future: context.read<CommentsRepository>().commentsFetch(_story.kids),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return CommentsListView(
                  comments: snapshot.requireData, story: _story);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
