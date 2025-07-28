import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_layout_provider.g.dart';

final route = ['/home', '/search', '/profile'];

@riverpod
class ShellLayout extends _$ShellLayout {
  static const List<String> _routes = ['/home', '/todo'];

  @override
  int build() => 0;

  void updateIndex(int index) {
    state = index;
  }

  void handleBottomNavTap(BuildContext context, int index) {
    // 마지막 탭(마이페이지)을 클릭한 경우 BottomSheet 표시
    // 다른 탭들은 페이지 이동
    if (index != state && index < _routes.length) {
      state = index;
      context.go(_routes[index]);
    }
  }

  int getBottomNavIndexFromLocation(String location) {
    switch (location) {
      case '/home':
        return 0;
      case '/search':
        return 1;
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    // 해당 인덱스에 맞는 경로로 이동
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }
}
