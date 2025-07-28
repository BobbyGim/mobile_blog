import 'package:go_router/go_router.dart';
import 'package:mobile_blog/core/layout/shell_layout.dart';
import 'package:mobile_blog/features/home/home_page.dart';
import 'package:mobile_blog/features/search/search_page.dart';
import 'package:mobile_blog/features/profile/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => ShellLayout(child: child),
      routes: [
        GoRoute(
          path: '/home',
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
  ],
);
