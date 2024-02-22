import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_beats/themes/dark_mode.dart';
import 'package:music_beats/themes/light_mode.dart';
import 'package:music_beats/views/about_me.dart';
import 'package:music_beats/views/playlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('themeBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeBox = Hive.box('themeBox');

    bool isDarkMode = themeBox.get('isDarkMode', defaultValue: false) ?? false;

    return GetMaterialApp(
      theme: isDarkMode ? darkMode : lightMode,
      debugShowCheckedModeBanner: false,
      home: const PlayList(),
    );
  }
}
