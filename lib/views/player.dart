import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_beats/consts/colors.dart';
import 'package:music_beats/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../components/my_box.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              //artwork song image
              Expanded(
                child: MyBox(
                  child: Column(
                    children: [
                      Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 300,
                          width: 280,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: QueryArtworkWidget(
                            id: data[controller.playIndex.value].id,
                            type: ArtworkType.AUDIO,
                            artworkHeight: double.infinity,
                            artworkWidth: double.infinity,
                            nullArtworkWidget: const Icon(Icons.music_note),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //music name
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Text(
                                    data[controller.playIndex.value]
                                        .displayNameWOExt,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 110, 107, 107),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    //textAlign: TextAlign.center,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                //artist name
                                Text(
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  data[controller.playIndex.value]
                                      .artist
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //aru kura
              MyBox(
                //start time,shuffle button, repeat button, end time
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(controller.position.value),
                            const Icon(Icons.shuffle),
                            const Icon(Icons.repeat),
                            Text(controller.duration.value),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //linear bar
                      MyBox(
                          child: Slider(
                              thumbColor: slideColor,
                              value: controller.value.value,
                              inactiveColor: bgColor,
                              activeColor: slideColor,
                              min: const Duration(seconds: 0)
                                  .inSeconds
                                  .toDouble(),
                              max: controller.max.value,
                              onChanged: (newValue) {
                                controller
                                    .changeDurationToSeconds(newValue.toInt());
                                newValue = newValue;
                              })),

                      //previous song,play pause button, next song
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                  //previous btn
                                  child: MyBox(
                                child: IconButton(
                                  onPressed: () {
                                    controller.playSongs(
                                        data[controller.playIndex.value - 1]
                                            .uri,
                                        controller.playIndex.value - 1);
                                  },
                                  icon: const Icon(
                                    Icons.skip_previous,
                                    size: 35,
                                  ),
                                ),
                              )),
                              //pause btn
                              Obx(
                                () => Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                              //next btn
                              Expanded(
                                  child: MyBox(
                                child: IconButton(
                                  onPressed: () {
                                    controller.playSongs(
                                        data[controller.playIndex.value + 1]
                                            .uri,
                                        controller.playIndex.value + 1);
                                  },
                                  icon: const Icon(
                                    Icons.skip_next,
                                    size: 35,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
