import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'views/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "sans_regular",
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.white,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
