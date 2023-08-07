import 'package:flutter/material.dart';
import 'package:hacker_news/repositories/ask_story_repository.dart';
import 'package:hacker_news/stories/stories_list_view.dart';
import 'package:provider/provider.dart';

class StoresAskView extends StatefulWidget {
  const StoresAskView({super.key});

  @override
  State<StoresAskView> createState() => _StoresAskViewState();
}

class _StoresAskViewState extends State<StoresAskView>
    with AutomaticKeepAliveClientMixin<StoresAskView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final repository = context.read<AskStoryRepository>();
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
