import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:url_launcher/link.dart';

class BehindHorusPage extends StatelessWidget {
  const BehindHorusPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List> developerList = [
      [
        "Darren Aldrich",
        "Beloved Hustler",
        "https://www.linkedin.com/in/dardrich/",
        "assets/darren.jpeg"
      ],
      [
        "Harman Hakim",
        "Beloved Hustler",
        "https://www.linkedin.com/in/harmanhakim/",
        "assets/harman.jpeg"
      ],
      [
        "Muhammad Vito Secona",
        "Beloved Hacker",
        "https://www.linkedin.com/in/secona/",
        "assets/vito.jpg"
      ],
      [
        "Andrew Devito Aryo",
        "Beloved Hipster",
        "https://www.linkedin.com/in/andrewaryo",
        "assets/AndrewDevitoAryo_FotoDiri.jpg"
      ]
    ];
    List servicesList = [
      ["flutter", "https://flutter.dev"],
      ["firebase", "https://firebase.google.com"],
      ["golang", "https://go.dev"],
      ["websocket", "https://socket.io"],
      ["cloud", "https://cloud.google.com"],
      ["android", "https://developer.android.com"],
      ["figma", "https://www.figma.com"],
      ["canva", "https://www.canva.com"],
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Behind Horus",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Developer",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),

              // Main Card
              Column(
                children: developerList
                    .map((item) => Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(item[3]),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item[0],
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      item[1],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFADADAD)),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset("assets/linkedin.png",
                                            scale: 3),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Link(
                                            target: LinkTarget.self,
                                            uri: Uri.parse(item[2]),
                                            builder: (context, followLink) {
                                              return GestureDetector(
                                                onTap: followLink,
                                                child: Text(
                                                  item[2].toString().replaceAll(
                                                      "https://www.", ""),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF21209C)),
                                                ),
                                              );
                                            })
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ))
                    .toList(),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text(
                "Words from us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We, AdInfinitum, express our gratitude to you for downloading this application. The purpose of this application is to contribute to the realization of one of the United Nations' goals, specifically SDG 10, which focuses on reducing inequalities, and SDG 5, which aims to achieve gender equality. Thank you for joining us in our commitment to advancing these sustainable development objectives.~ Ad Infinitum",
                style: TextStyle(
                    height: 2, fontWeight: FontWeight.w100, fontSize: 12),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text(
                "Services Used",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: servicesList
                      .sublist(0, 4)
                      .map((e) => Link(
                            target: LinkTarget.self,
                            uri: Uri.parse(e[1]),
                            builder: (context, followLink) {
                              return FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: followLink,
                                child: SizedBox(
                                  height: 300,
                                  child: Center(
                                    child:
                                        Image.asset("${"assets/" + e[0]}.png"),
                                  ),
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: servicesList
                      .sublist(4, 8)
                      .map((e) => Link(
                            target: LinkTarget.self,
                            uri: Uri.parse(e[1]),
                            builder: (context, followLink) {
                              return FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: followLink,
                                child: SizedBox(
                                  height: 300,
                                  child: Center(
                                    child:
                                        Image.asset("${"assets/" + e[0]}.png"),
                                  ),
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Our Survey",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(Icons.link),
                  const SizedBox(
                    width: 20,
                  ),
                  Link(
                      target: LinkTarget.self,
                      uri: Uri.parse("https://forms.gle/sL57vvkCcy6gS1Mp9"),
                      builder: (context, followLink) {
                        return GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            "https://forms.gle/sL57vvkCcy6gS1Mp9",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFF21209C)),
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
