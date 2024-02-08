import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_beats/components/my_box.dart';
import 'package:music_beats/components/my_drawer.dart';
import 'package:music_beats/views/device_songs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("M U S I C   Beats"),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    // Get.to(() => );
                  },
                  child: const MyBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(" Your playlist"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const DeviceSongsScreen());
                },
                child: const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: MyBox(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(" Songs from this device")),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
