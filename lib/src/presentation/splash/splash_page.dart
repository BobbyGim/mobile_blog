import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_blog/src/core/router/router_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.go(RouterPath.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width / 1,
              errorBuilder: (context, error, stackTrace) {
                print('Image loading error: $error');
                return Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, color: Colors.red, size: 50),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
