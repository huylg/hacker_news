import 'dart:convert';

import 'package:hacker_news/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<Comment> _commentFetch(int id) => http
      .get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'))
      .then((value) {
        if (value.statusCode == 200) return value.body;
        throw Exception('Failed to load comment');
      })
      .then(jsonDecode)
      .then((value) => value as Map<String, dynamic>)
      .then(Comment.fromJson);

  Future<List<Comment>> commentsFetch(List<int> ids) =>
      Future.wait(ids.map(_commentFetch)).then((comments) =>
          comments.where((comment) => comment.text != null).toList());
}
