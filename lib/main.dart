import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/router.dart';
import 'package:package_info_plus/package_info_plus.dart';

final packageInfoCahed = AsyncMemoizer<PackageInfo>();
final _router = GoRouter(routes: $appRoutes);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await packageInfoCahed.runOnce(() => PackageInfo.fromPlatform());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Hacker News',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.orangeAccent,
          brightness: Brightness.dark,
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        routerConfig: _router,
      );
}
