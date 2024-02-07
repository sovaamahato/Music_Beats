import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_beats/consts/colors.dart';
import 'package:music_beats/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../components/my_box.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //artwork song image
            Expanded(
              child: MyBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 340,
                      width: 350,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: QueryArtworkWidget(
                        id: data.id,
                        type: ArtworkType.AUDIO,
                        artworkHeight: double.infinity,
                        artworkWidth: double.infinity,
                        nullArtworkWidget: const Icon(Icons.music_note),
                      )),
                ),
              ),
            ),

            //aru kura
            Expanded(
                child: MyBox(
              //start time,shuffle button, repeat button, end time
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //music name
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(
                                data.displayNameWOExt,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 110, 107, 107),
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            //artist name
                            Text(
                              data.artist.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("0:00"),
                      Icon(Icons.shuffle),
                      Icon(Icons.repeat),
                      Text("4:20"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //linear bar
                  MyBox(
                      child: Slider(
                          thumbColor: slideColor,
                          value: 1.0,
                          inactiveColor: bgColor,
                          activeColor: slideColor,
                          onChanged: (newValue) {})),

                  //previous song,play pause button, next song
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        const Expanded(
                            child: MyBox(
                          child: Icon(
                            Icons.skip_previous,
                            size: 35,
                          ),
                        )),
                        Obx(
                          () => Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: MyBox(
                                  child: IconButton(
                                      onPressed: () {
                                        if (controller.isplaying.value) {
                                          controller.audioPlayer.pause();
                                          controller.isplaying(false);
                                        } else {
                                          controller.audioPlayer.play();
                                          controller.isplaying(true);
                                        }
                                      },
                                      icon: controller.isplaying.value
                                          ? const Icon(
                                              Icons.pause,
                                              size: 35,
                                            )
                                          : const Icon(
                                              Icons.play_arrow,
                                              size: 35,
                                            )),
                                ),
                              )),
                        ),
                        Expanded(
                            child: MyBox(
                          child: Icon(
                            Icons.skip_next,
                            size: 35,
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
