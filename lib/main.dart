import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/brightness_change_notifier.dart';
import 'package:hacker_news/material3_design_flag_change_notifer.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/comments_repository.dart';
import 'package:hacker_news/repositories/html_metadata_repository.dart';
import 'package:hacker_news/router.dart';
import 'package:provider/provider.dart';

final _router = GoRouter(routes: $appRoutes);

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BrightnessChangeNotifier()),
          ChangeNotifierProvider(
              create: (_) => Material3DesignFlagChangeNotifier()),
          Provider(create: (_) => BookmarksRepository()),
          Provider(create: (_) => CommentsRepository()),
          Provider(create: (_) => HtmlMetadataRepository()),
        ],
        builder: (context, _) => MaterialApp.router(
          title: 'Hacker News',
          theme: ThemeData(
            useMaterial3: context
                .watch<Material3DesignFlagChangeNotifier>()
                .material3DesignFlag,
            colorSchemeSeed: Colors.orangeAccent,
            brightness: context.watch<BrightnessChangeNotifier>().brightness,
          ),
          routerConfig: _router,
        ),
      );
}
