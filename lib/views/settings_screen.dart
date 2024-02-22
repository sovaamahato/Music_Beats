import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_beats/themes/dark_mode.dart';
import 'package:music_beats/themes/light_mode.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    var themeBox = Hive.box('themeBox');
    isDarkMode = themeBox.get('isDarkMode', defaultValue: false) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Settings",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                isDarkMode ? "light mode" : "Dark Mode",
                style: TextStyle(
                  fontFamily: "sans_bold",
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Use your lightMode and darkMode directly
                  Get.changeTheme(value ? darkMode : lightMode);
                  print('Is Dark Mode: $isDarkMode');
                  Hive.box('themeBox').put('isDarkMode', value);
                });
              },
            ),
            // Add more settings if needed
          ],
        ),
      ),
    );
  }
}
