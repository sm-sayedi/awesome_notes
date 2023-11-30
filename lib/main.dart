import 'package:awesome_notes/core/constants.dart';
import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: background,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: background,
              titleTextStyle: const TextStyle(
                color: primary,
                fontSize: 32,
                fontFamily: 'Fredoka',
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
      home: const MainPage(),
    );
  }
}
