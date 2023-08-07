import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/brightness_change_notifier.dart';
import 'package:hacker_news/repositories/ask_story_repository.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:hacker_news/repositories/job_story_repository.dart';
import 'package:hacker_news/repositories/new_story_repository.dart';
import 'package:hacker_news/repositories/show_story_repository.dart';
import 'package:hacker_news/repositories/top_story_repository.dart';
import 'package:hacker_news/router.dart';
import 'package:provider/provider.dart';

final _router = GoRouter(routes: $appRoutes);
final _bookmarksRepository = BookmarksRepository();

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BrightnessChangeNotifier()),
          Provider(create: (_) => _bookmarksRepository),
          Provider(create: (_) => CommentsRepository()),
          Provider(create: (_) => TopStoryRepository(_bookmarksRepository)),
          Provider(create: (_) => NewStoryRepository(_bookmarksRepository)),
          Provider(create: (_) => ShowStoryRepository(_bookmarksRepository)),
          Provider(create: (_) => AskStoryRepository(_bookmarksRepository)),
          Provider(create: (_) => JobStoryRepository(_bookmarksRepository)),
        ],
        builder: (context, _) => MaterialApp.router(
          title: 'Hacker News',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.orangeAccent,
            brightness: context.watch<BrightnessChangeNotifier>().brightness,
          ),
          routerConfig: _router,
        ),
      );
}
