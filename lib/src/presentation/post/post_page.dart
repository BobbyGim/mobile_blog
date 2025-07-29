import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final int id;
  const PostPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('PostPage $id'));
  }
}
