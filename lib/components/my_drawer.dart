import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        //logo
        DrawerHeader(
          child: Center(
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),

        //home tile
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: ListTile(
            title: const Text("H O M E"),
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
        ),

        //setting tile

        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: ListTile(
            title: Text("S E T T I N G S"),
            leading: Icon(Icons.settings),
            onTap: () {
              //pop drawer
              Navigator.pop(context);
              //navigate to settings page
              Get.to(() => SettingScreen());
            },
          ),
        ),
      ]),
    );
  }
}
