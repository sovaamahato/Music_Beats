import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/about_me.dart';
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
            title: Text(
              "H O M E",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
        //about me
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: ListTile(
            title: Text(
              "A B O U T  M E",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {
              //pop drawer
              Navigator.pop(context);
              //navigate to settings page
              Get.to(() => AboutMe());
            },
          ),
        ),

        //setting tile

        // Padding(
        //   padding: const EdgeInsets.only(left: 25.0, top: 25),
        //   child: ListTile(
        //     title: Text(
        //       "S E T T I N G S",
        //       style: TextStyle(
        //           color: Theme.of(context).colorScheme.inversePrimary),
        //     ),
        //     leading: Icon(
        //       Icons.settings,
        //       color: Theme.of(context).colorScheme.inversePrimary,
        //     ),
        //     onTap: () {
        //       //pop drawer
        //       Navigator.pop(context);
        //       //navigate to settings page
        //       Get.to(() => SettingScreen());
        //     },
        //   ),
        // ),
      ]),
    );
  }
}
