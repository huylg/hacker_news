import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';

class JobStoryRepository extends StoryRepository {
  JobStoryRepository(
    BookmarksRepository repository,
  ) : super(
          uri: Uri.parse(
              'https://hacker-news.firebaseio.com/v0/jobstories.json'),
          bookmarksRepository: repository,
        );
}
