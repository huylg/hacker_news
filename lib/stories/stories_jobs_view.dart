import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/job_story_repository.dart';
import 'package:hacker_news/stories/stories_list_view.dart';
import 'package:provider/provider.dart';

class StoriesJobsView extends StatefulWidget {
  const StoriesJobsView({super.key});

  @override
  State<StoriesJobsView> createState() => _StoriesJobsViewState();
}

class _StoriesJobsViewState extends State<StoriesJobsView>
    with AutomaticKeepAliveClientMixin<StoriesJobsView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final repository = context.read<JobStoryRepository>();
    return FutureBuilder(
      future: repository.fetchStories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StoriesListView(
            data: snapshot.requireData,
            repository: repository,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
