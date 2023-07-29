import 'dart:convert';

import 'package:async/async.dart';
import 'package:hacker_news/models/stories_pagination.dart';
import 'package:hacker_news/repositories/story_fetch.dart';
import 'package:http/http.dart' as http;

class StoriesTopRepository {
  var _cached = AsyncMemoizer<List<int>>();

  Future<List<int>> _fetchStoriesId() => _cached.runOnce(() => http
      .get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'))
      .then((value) {
        if (value.statusCode == 200) {
          return value.body;
        }
        throw Exception('Failed to load top stories');
      })
      .then(jsonDecode)
      .then((value) => List<int>.from(value)));

  Future<StoriesPagination> fetchMoreTopStories(
      StoriesPagination current) async {
    final storiesId = await _fetchStoriesId();
    final stories = await Future.wait(
        storiesId.skip(current.offset * 30).take(30).map(storyFetch));

    return (
      stories: [...current.stories, ...stories],
      offset: current.offset + 1,
      total: current.total
    );
  }

  Future<StoriesPagination> refetchTopStories() async {
    _cached = AsyncMemoizer<List<int>>();
    return fetchTopStories();
  }

  Future<StoriesPagination> fetchTopStories() async {
    final storiesId = await _fetchStoriesId();
    final stories = await Future.wait(storiesId.take(30).map(storyFetch));

    return (
      stories: stories,
      offset: 0,
      total: storiesId.length,
    );
  }
}

final storiesTopRepository = StoriesTopRepository();
