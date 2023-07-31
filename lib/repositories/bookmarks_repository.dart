import 'dart:convert';

import 'package:hacker_news/models/story.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarksRepository {
  Future<List<Story>> bookmarksFetch() => SharedPreferences.getInstance()
      .then((value) => value.getStringList('bookmarks') ?? <String>[])
      .then((value) => value.map(jsonDecode))
      .then((value) => value.cast<Map<String, dynamic>>())
      .then((value) => value.map(Story.fromJson).toList());

  Future<void> bookmark(Story story) =>
      SharedPreferences.getInstance().then((value) => value.setStringList(
            'bookmarks',
            [
              jsonEncode(story.toJson()),
              ...?value.getStringList('bookmarks'),
            ],
          ));

  Future<void> unbookmark(int story) =>
      SharedPreferences.getInstance().then((value) => value.setStringList(
          'bookmarks',
          value
                  .getStringList('bookmarks')
                  ?.map(jsonDecode)
                  .cast<Map<String, dynamic>>()
                  .where((element) => element['id'] != story)
                  .map(jsonEncode)
                  .toList() ??
              <String>[]));
}
