import 'package:flutter/material.dart';
import 'package:music_beats/components/my_box.dart';
import 'package:music_beats/consts/colors.dart';
import 'package:music_beats/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,

        body: SafeArea(
      child: Column(
        children: [
          //mero appbar------------
          //return button, menu button
          Container(
            color: Colors.grey[300],
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: MyBox(child: Icon(Icons.menu)),
                  ),
                  Text("Music Beats"),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: MyBox(
                      child: Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 7,
            color: white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: MyBox(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: bgColor,
                          title: Text(
                            "Music name",
                            style: ourStyle(
                              family: bold,
                              color: bgDarkColor,
                              size: 15,
                            ),
                          ),
                          subtitle: Text(
                            "Artist name",
                            style: ourStyle(
                              family: regular,
                              size: 12,
                            ),
                          ),
                          leading: const Icon(
                            Icons.music_note,
                            color: bgDarkColor,
                            size: 12,
                          ),
                          trailing: const Icon(
                            Icons.play_arrow,
                            color: bgDarkColor,
                            size: 26,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
