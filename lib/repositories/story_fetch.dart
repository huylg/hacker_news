import 'dart:convert';

import 'package:hacker_news/models/story.dart';
import 'package:http/http.dart' as http;

Future<Story> storyFetch(int id) => http
    .get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'))
    .then((value) {
      if (value.statusCode == 200) {
        return value.body;
      }
      throw Exception('Failed to load story');
    })
    .then(jsonDecode)
    .then((value) => value as Map<String, dynamic>)
    .then(Story.fromJson);
