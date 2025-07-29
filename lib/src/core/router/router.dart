import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_blog/src/core/layout/shell_layout.dart';
import 'package:mobile_blog/src/core/router/router_path.dart';
import 'package:mobile_blog/src/presentation/home/home_page.dart';
import 'package:mobile_blog/src/presentation/post/post_page.dart';
import 'package:mobile_blog/src/presentation/profile/profile_page.dart';
import 'package:mobile_blog/src/presentation/search/search_page.dart';
import 'package:mobile_blog/src/presentation/splash/splash_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> postNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: RouterPath.home,
  debugLogDiagnostics: true,
  routes: [
    // GoRoute(
    //   path: RouterPath.splash,
    //   pageBuilder: (context, state) =>
    //       NoTransitionPage(child: const SplashPage()),
    // ),
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) => ShellLayout(child: child),
      routes: [
        GoRoute(
          path: RouterPath.home,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const HomePage()),
        ),
        GoRoute(
          path: RouterPath.search,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const SearchPage()),
        ),
        GoRoute(
          path: RouterPath.profile,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const ProfilePage()),
        ),
      ],
    ),
    GoRoute(
      path: RouterPath.post,
      pageBuilder: (context, state) => NoTransitionPage(
        child: PostPage(id: int.parse(state.pathParameters['id']!)),
      ),
    ),
  ],
);
