import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/job_story_repository.dart';
import 'package:hacker_news/repositories/story_repostitory.dart';
import 'package:hacker_news/stories/stories_view.dart';
import 'package:provider/provider.dart';

class StoriesJobsView extends StatelessWidget {
  const StoriesJobsView({super.key});

  @override
  Widget build(BuildContext context) => Provider<StoryRepository>(
        create: (_) => JobStoryRepository(context.read<BookmarksRepository>()),
        child: const StoriesView(),
      );
}
