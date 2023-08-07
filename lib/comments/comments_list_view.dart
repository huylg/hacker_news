import 'package:flutter/material.dart';
import 'package:hacker_news/comments/comment_item.dart';
import 'package:hacker_news/models/comment.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:hacker_news/repositories/top_story_repository.dart';
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
    var commentsRepository = context.read<CommentsRepository>();
    return RefreshIndicator(
      onRefresh: () async {
        final newStory =
            await context.read<TopStoryRepository>().storyFetch(_story.id);
        final newComments =
            await commentsRepository.commentsFetch(newStory.kids);
        setState(() {
          _story = newStory;
          _comments = newComments;
        });
      },
      child: ListView.separated(
          itemCount: _comments.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTile(
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
                      '${_story.score} points | ${widget.story.descendants} comments',
                    ),
                  ],
                ),
              );
            }
            return CommentItem(_comments[index - 1]);
          },
          separatorBuilder: (_, __) => const Divider()),
    );
  }
}
