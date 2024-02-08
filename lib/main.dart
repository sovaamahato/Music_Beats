import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_beats/themes/light_mode.dart';
import 'package:music_beats/views/playlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const PlayList(),
    );
  }
}
