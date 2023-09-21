import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hacker_news/models/stories_pagination.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

abstract class StoryRepository {
  StoryRepository({
    required this.uri,
    required this.bookmarksRepository,
  });

  final BookmarksRepository bookmarksRepository;
  var _cached = AsyncMemoizer<List<int>>();

  final Uri uri;

  static Future<FileInfo> getPreviewImage(String url) => http
      .get(Uri.parse(url))
      .then((value) => value.body)
      .then((value) => Isolate.run(() => parse(value)))
      .then((value) => value.getElementsByTagName('meta'))
      .then((value) => value.firstWhere(
          (element) => element.attributes['property'] == 'og:image'))
      .then((value) => value.attributes['content']!)
      .then((value) => DefaultCacheManager().downloadFile(value));

  Future<List<int>> _fetchStoriesId() => _cached.runOnce(() => http
      .get(uri)
      .then((value) {
        if (value.statusCode == 200) {
          return value.body;
        }
        throw Exception('Failed to load top stories');
      })
      .then(jsonDecode)
      .then((value) => List<int>.from(value)));

  static Future<Story> storyFetch(int id) => http
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

  Future<StoriesPagination> fetchMoreTopStories(
      StoriesPagination current) async {
    final storiesId = await _fetchStoriesId();
    final stories = await Future.wait(
        storiesId.skip(current.offset * 30).take(30).map(storyFetch));
    await stories
        .map((e) => e.url)
        .whereNotNull()
        .map(getPreviewImage)
        .wait
        .onError<ParallelWaitError<List<FileInfo?>, List<AsyncError?>>>(
            (error, stackTrace) => error.values.whereNotNull().toList());

    return (
      stories: [...current.stories, ...stories],
      offset: current.offset + 1,
      total: current.total
    );
  }

  Future<StoriesPagination> refetchStories() {
    _cached = AsyncMemoizer<List<int>>();
    return fetchStories();
  }

  Future<StoriesPagination> fetchStories() async {
    final (storiesId, bookmarks) = await (
      _fetchStoriesId(),
      bookmarksRepository
          .bookmarksFetch()
          .then((value) => value.map((e) => e.id))
          .then((value) => value.toSet())
    ).wait;

    final stories = await Future.wait(storiesId.take(30).map(storyFetch))
        .then((value) =>
            value.map((e) => e.copyWith(isFavorite: bookmarks.contains(e.id))))
        .then((value) => value.toList());
    await stories
        .map((e) => e.url)
        .whereNotNull()
        .map(getPreviewImage)
        .wait
        .onError<ParallelWaitError<List<FileInfo?>, List<AsyncError?>>>(
            (error, stackTrace) => error.values.whereNotNull().toList());

    return (
      stories: stories,
      offset: 0,
      total: storiesId.length,
    );
  }
}
