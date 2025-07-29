import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    Key? key,
    required this.child,
    this.title,
    this.actions,
    this.automaticallyImplyLeading,
    this.bottomNavigationBar,
    this.centerTitle,
  }) : super(key: key);

  final Widget child;
  final String? title;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(
                title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              elevation: 3.0,
              shadowColor: Colors.black,
              centerTitle: false,
              actions: actions,
              automaticallyImplyLeading: automaticallyImplyLeading ?? false,
            )
          : null,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
