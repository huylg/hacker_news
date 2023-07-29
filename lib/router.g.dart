// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $storiesRoute,
      $bookmarksRoute,
      $moreRoute,
    ];

RouteBase get $storiesRoute => GoRouteData.$route(
      path: '/',
      factory: $StoriesRouteExtension._fromState,
    );

extension $StoriesRouteExtension on StoriesRoute {
  static StoriesRoute _fromState(GoRouterState state) => const StoriesRoute();

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
