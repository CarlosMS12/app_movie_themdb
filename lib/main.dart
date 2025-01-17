import 'package:app_movie_tbm/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Movie',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff004cd9),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const MyNavigator(),
    );
  }
}
