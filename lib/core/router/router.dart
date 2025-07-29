import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_blog/core/layout/shell_layout.dart';
import 'package:mobile_blog/features/home/home_page.dart';
import 'package:mobile_blog/features/post/post_page.dart';
import 'package:mobile_blog/features/search/search_page.dart';
import 'package:mobile_blog/features/profile/profile_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> postNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true, // 디버그 로그 활성화
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) => ShellLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const HomePage()),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const SearchPage()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const ProfilePage()),
        ),
      ],
    ),
    GoRoute(
      path: '/post/:id',
      pageBuilder: (context, state) => NoTransitionPage(
        child: PostPage(id: int.parse(state.pathParameters['id']!)),
      ),
    ),
  ],
);
