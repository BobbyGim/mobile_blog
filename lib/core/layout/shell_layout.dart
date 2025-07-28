import 'package:flutter/material.dart';
import 'package:mobile_blog/core/layout/providers/shell_layout_provider.dart';
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
    final indexFromLocation = setBottomNav.getBottomNavIndexFromLocation(
      location,
    );

    if (currentIndex != indexFromLocation) {
      Future.microtask(() {
        setBottomNav.updateIndex(indexFromLocation);
      });
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexFromLocation,
        onTap: (index) => setBottomNav.onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
