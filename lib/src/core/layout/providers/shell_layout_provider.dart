import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_layout_provider.g.dart';

final route = ['/home', '/search', '/profile'];

@riverpod
class ShellLayout extends _$ShellLayout {
  static const List<String> _routes = ['/home', '/search', '/profile'];

  @override
  int build() {
    return 0;
  }

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
    int result;
    switch (location) {
      case '/':
        result = 0;
        break;
      case '/search':
        result = 1;
        break;
      case '/profile':
        result = 2;
        break;
      default:
        result = 0;
    }
    return result;
  }

  void onItemTapped(BuildContext context, int index) {
    HapticFeedback.selectionClick();
    switch (index) {
      case 0:
        context.go('/');
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
