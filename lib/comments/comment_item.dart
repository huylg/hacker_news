import 'package:flutter/material.dart';
import 'package:hacker_news/models/comment.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:hacker_news/timeago.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommentItem extends StatefulWidget {
  const CommentItem(this.comment, {super.key});

  final Comment comment;

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  Future<List<Comment>>? _future;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Builder(
        builder: (_) => switch ((widget.comment.by, widget.comment.time)) {
          (null, null) => const Text('unknown'),
          (_, null) => Text(widget.comment.by!),
          (_, _) => Text(
              '${widget.comment.by} - ${timeago(DateTime.fromMillisecondsSinceEpoch(widget.comment.time! * 1000))}'),
        },
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.comment.kids.isNotEmpty)
            Text('${widget.comment.kids.length} comments'),
          Html(
            onLinkTap: (url, attributes, element) => launchUrlString(url!),
            data: widget.comment.text ?? '',
            style: {
              "body": Style(padding: HtmlPaddings.zero, margin: Margins.zero)
            },
          ),
          if (widget.comment.kids.isNotEmpty)
            FutureBuilder(
                future: _future,
                builder: (context, snapshot) =>
                    switch ((snapshot.connectionState, snapshot.hasError)) {
                      (ConnectionState.none, _) ||
                      (ConnectionState.done, true) =>
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _future = context
                                  .read<CommentsRepository>()
                                  .commentsFetch(widget.comment.kids);
                            });
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text('Show replies'),
                        ),
                      (ConnectionState.waiting, _) => const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 1),
                        ),
                      _ => Column(
                          children: snapshot.requireData
                              .map(CommentItem.new)
                              .toList(),
                        )
                    }),
        ],
      ),
    );
  }
}
