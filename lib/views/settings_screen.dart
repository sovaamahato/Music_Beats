import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //dark mode
          const Text(
            "Dark Mode",
            style:
                TextStyle(fontFamily: "snas_bold", fontWeight: FontWeight.bold),
          ),
          //switch button
          CupertinoSwitch(value: false, onChanged: (value) {})
        ]),
      ),
    );
  }
}
