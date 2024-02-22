import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me "),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //imge
            Align(
              alignment: Alignment.topRight,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/me.png",
                  fit: BoxFit.cover,
                  //isAntiAlias: true,
                  height: 300,
                  width: 300,
                  // width: 400,
                ),
              ),
            ),

            //details haru
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sova Kushwaha",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Acomplished Mobile App developer who is able to cretae mobile applications for every mobile software system platform.",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Connect with me",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrl(Uri(
                                path:
                                    "https://www.facebook.com/sova.mahato.754"));
                          },
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.whatshot,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrl(Uri(
                                path:
                                    "https://www.instagram.com/kushwaha_sovaa/"));
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.facebook_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
