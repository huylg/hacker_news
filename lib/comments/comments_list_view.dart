import 'package:flutter/material.dart';
import 'package:hacker_news/comments/comment_item.dart';
import 'package:hacker_news/models/comment.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';
import 'package:hacker_news/timeago.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommentsListView extends StatefulWidget {
  const CommentsListView(
      {super.key, required this.comments, required this.story});
  final List<Comment> comments;
  final Story story;

  @override
  State<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  late List<Comment> _comments;
  late Story _story;

  @override
  void initState() {
    super.initState();
    _comments = widget.comments;
    _story = widget.story;
  }

  @override
  Widget build(BuildContext context) {
    final commentsRepository = context.read<CommentsRepository>();
    return RefreshIndicator(
      onRefresh: () async {
        final newStory = await StoryRepository.storyFetch(_story.id);
        final newComments =
            await commentsRepository.commentsFetch(newStory.kids);
        setState(() {
          _story = newStory;
          _comments = newComments;
        });
      },
      child: ListView.separated(
          itemCount: _comments.length + 1,
          itemBuilder: (context, index) => switch (index) {
                0 => ListTile(
                    isThreeLine: true,
                    titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    onTap: () => launchUrlString(_story.url!),
                    title: Text(_story.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _story.time == null
                            ? Text(_story.by)
                            : Text(
                                '${_story.by} - ${timeago(DateTime.fromMillisecondsSinceEpoch(widget.story.time! * 1000))}'),
                        Text(
                            '${_story.score} points | ${widget.story.descendants} comments'),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text('Comments',
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                    ),
                  ),
                _ => CommentItem(_comments[index - 1]),
              },
          separatorBuilder: (_, __) => const Divider()),
    );
  }
}
