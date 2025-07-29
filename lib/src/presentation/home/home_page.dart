import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_blog/src/core/layout/widget/default_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '홈',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('현재 경로: ${GoRouterState.of(context).matchedLocation}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/search'),
              child: const Text('검색 페이지로 '),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('프로필 페이지로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
