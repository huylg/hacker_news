import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/bookmarks/bookmarks_page.dart';
import 'package:hacker_news/more/more_page.dart';
import 'package:hacker_news/stories/stories_page.dart';

part 'router.g.dart';

@TypedGoRoute<StoriesRoute>(
  path: '/',
)
class StoriesRoute extends GoRouteData {
  const StoriesRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: StoriesPage());
}

@TypedGoRoute<BookmarksRoute>(
  path: '/bookmarks',
)
class BookmarksRoute extends GoRouteData {
  const BookmarksRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: BookmarksPage());
}

@TypedGoRoute<MoreRoute>(
  path: '/more',
)
class MoreRoute extends GoRouteData {
  const MoreRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: MorePage());
}
