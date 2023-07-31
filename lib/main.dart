import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/brightness_change_notifier.dart';
import 'package:hacker_news/repositories/bookmarks_repository.dart';
import 'package:hacker_news/repositories/stories_top_repository.dart';
import 'package:hacker_news/router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

final packageInfoCahed = AsyncMemoizer<PackageInfo>();
final _router = GoRouter(routes: $appRoutes);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarksRepository = BookmarksRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BrightnessChangeNotifier()),
        Provider(create: (_) => bookmarksRepository),
        Provider(create: (_) => StoriesTopRepository(bookmarksRepository)),
      ],
      builder: (context, __) => MaterialApp.router(
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
}
