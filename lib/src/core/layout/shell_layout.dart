import 'package:flutter/material.dart';
import 'package:mobile_blog/src/core/layout/providers/shell_layout_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShellLayout extends ConsumerWidget {
  const ShellLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouter.of(context).location;
    final currentIndex = ref.watch(shellLayoutProvider);
    final setBottomNav = ref.read(shellLayoutProvider.notifier);

    // location을 직접 체크해서 인덱스 계산
    int indexFromLocation;
    if (location.contains('/search')) {
      indexFromLocation = 1;
    } else if (location.contains('/profile')) {
      indexFromLocation = 2;
    } else if (location.contains('/')) {
      indexFromLocation = 0;
    } else {
      indexFromLocation = 0; // 기본값
    }

    print('=== DEBUG ===');
    print('Raw location: "$location"');
    print('Contains /home: ${location.contains('/home')}');
    print('Contains /search: ${location.contains('/search')}');
    print('Contains /profile: ${location.contains('/profile')}');
    print('Calculated indexFromLocation: $indexFromLocation');
    print('Current provider index: $currentIndex');
    print('=============');

    // build 이후에 안전하게 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentIndex != indexFromLocation) {
        print('Updating provider from $currentIndex to $indexFromLocation');
        setBottomNav.updateIndex(indexFromLocation);
      }
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexFromLocation, // 직접 계산한 값 사용
        onTap: (index) => setBottomNav.onItemTapped(context, index),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
