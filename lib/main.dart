import 'package:flutter/material.dart';
import 'package:future_builder_example/screens/posts_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostsScreen(),
      theme: ThemeData.dark(),
    );
  }
}
