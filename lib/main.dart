import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_home_page.dart';

void main() {
  runApp(const PositiveAffirmationsApp());
}

class PositiveAffirmationsApp extends StatelessWidget {
  const PositiveAffirmationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'التوكيدات الإيجابية',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F6F2),
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}