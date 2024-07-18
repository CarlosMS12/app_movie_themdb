import 'package:app_movie_tbm/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Movie',
      home: ProfilePage(),
    );
  }
}
