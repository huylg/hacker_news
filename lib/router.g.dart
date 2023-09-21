// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $topStoriesRoute,
      $bookmarksRoute,
      $moreRoute,
    ];

RouteBase get $topStoriesRoute => GoRouteData.$route(
      path: '/',
      factory: $TopStoriesRouteExtension._fromState,
    );

extension $TopStoriesRouteExtension on TopStoriesRoute {
  static TopStoriesRoute _fromState(GoRouterState state) =>
      const TopStoriesRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $bookmarksRoute => GoRouteData.$route(
      path: '/bookmarks',
      factory: $BookmarksRouteExtension._fromState,
    );

extension $BookmarksRouteExtension on BookmarksRoute {
  static BookmarksRoute _fromState(GoRouterState state) =>
      const BookmarksRoute();

  String get location => GoRouteData.$location(
        '/bookmarks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $moreRoute => GoRouteData.$route(
      path: '/more',
      factory: $MoreRouteExtension._fromState,
    );

extension $MoreRouteExtension on MoreRoute {
  static MoreRoute _fromState(GoRouterState state) => const MoreRoute();

  String get location => GoRouteData.$location(
        '/more',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
