import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';

class TopStoryRepository extends StoryRepository {
  TopStoryRepository(
    BookmarksRepository repository,
  ) : super(
          uri: Uri.parse(
              'https://hacker-news.firebaseio.com/v0/topstories.json'),
          bookmarksRepository: repository,
        );
}
