import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_beats/components/my_box.dart';
import 'package:music_beats/components/my_drawer.dart';
import 'package:music_beats/consts/colors.dart';
import 'package:music_beats/consts/text_style.dart';
import 'package:music_beats/controller/player_controller.dart';
import 'package:music_beats/views/about_me.dart';
import 'package:music_beats/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

final GlobalKey _sKey = GlobalKey();

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
        key: _sKey,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: Text(
            "Music Beats",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          leading: InkWell(
              onTap: () {
                Get.to(() => MyDrawer());
              },
              //onTap: () => Scaffold.of(context).openDrawer(),
              child: MyBox(
                  child: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.inversePrimary,
              ))),
          actions: [
            SizedBox(
              height: 50,
              width: 50,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => AboutMe()));
                },
                child: MyBox(
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            )
          ],
        ),
        // drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              height: 7,
              color: Theme.of(context).colorScheme.background,
            ),
            FutureBuilder<List<SongModel>>(
                future: controller.audioQuery.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL,
                ),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No songs ",
                        style: ourStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ));
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: MyBox(
                                  //---------------------------------------listtile
                                  child: Obx(
                                    () => ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      tileColor: bgColor,
                                      title: Text(
                                        snapshot.data![index].displayNameWOExt,
                                        style: ourStyle(
                                          family: bold,
                                          color: bgDarkColor,
                                          size: 18,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${snapshot.data![index].artist}",
                                        style: ourStyle(
                                          family: regular,
                                          size: 14,
                                        ),
                                      ),
                                      leading: QueryArtworkWidget(
                                        id: snapshot.data![index].id,
                                        type: ArtworkType.AUDIO,
                                        nullArtworkWidget: const Icon(
                                          Icons.music_note,
                                          size: 17,
                                        ),
                                      ),
                                      trailing:
                                          controller.playIndex.value == index &&
                                                  controller.isplaying.value
                                              ? const Icon(
                                                  Icons.play_arrow,
                                                  color: bgDarkColor,
                                                  size: 26,
                                                )
                                              : null,
                                      onTap: () {
                                        Get.to(
                                            () => Player(data: snapshot.data!),
                                            transition: Transition.downToUp);
                                        controller.playSongs(
                                            snapshot.data![index].uri, index);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }
                })
          ],
        ));
  }
}
