import 'package:flutter/material.dart';
import 'package:horus_frontend/AdEdu/ad_edu.dart';
import 'package:horus_frontend/AdForum/ad_forum.dart';
import 'package:horus_frontend/BehindHorus/behind_horus.dart';
import 'package:horus_frontend/Home/home_page.dart';
import 'package:horus_frontend/Profile/profile.dart';
import 'package:horus_frontend/Settings/settings.dart';
import 'package:horus_frontend/Start/start.dart';

class HorusSideBar extends StatelessWidget {
  const HorusSideBar({super.key, required this.currentPageIndex});

  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    List<List> menus = [
      [const Icon(Icons.home), "Home", const Homepage()],
      [const Icon(Icons.library_books), "Ad Edu", const AdEduPage()],
      [const Icon(Icons.forum), "Ad Forum", const AdForumPage()],
      [const Icon(Icons.info), "Behind Horus", const BehindHorusPage()],
    ];
    return NavigationDrawer(
      backgroundColor: Colors.white,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 49,
                        backgroundImage: AssetImage("assets/logo.png"),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Adin Wijaya",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "cuteadin@gmail.com",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "+62 8123 4567 8901",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Column(
                    children: menus
                        .map((e) => Column(
                              children: [
                                SideDrawerListItem(
                                    text: e[1],
                                    logo: e[0],
                                    backgroundColor:
                                        menus.indexOf(e).toString() ==
                                                currentPageIndex.toString()
                                            ? const Color(0xFFFDB827)
                                            : const Color(0xFFF1F1F1),
                                    contentColor: menus.indexOf(e).toString() ==
                                            currentPageIndex.toString()
                                        ? Colors.white
                                        : Colors.black,
                                    onTapFunction: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => e[2]));
                                    }),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SideDrawerListItem(
                          onTapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingPage()));
                          },
                          backgroundColor: Colors.black,
                          contentColor: Colors.white,
                          text: "Settings",
                          logo: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SideDrawerListItem(
                          onTapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Start()));
                          },
                          backgroundColor: const Color(0xFFFDB827),
                          contentColor: Colors.white,
                          text: "Sign Out",
                          buttonGradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF504FDD),
                                Color(0xFF21209C),
                              ]),
                          logo: const Icon(
                            Icons.door_back_door,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class SideDrawerListItem extends StatelessWidget {
  final String text;
  final Widget logo;
  final Color backgroundColor;
  final Color contentColor;

  final void Function() onTapFunction;

  final LinearGradient? buttonGradient;

  const SideDrawerListItem(
      {super.key,
      required this.text,
      required this.logo,
      required this.backgroundColor,
      required this.contentColor,
      this.buttonGradient,
      required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapFunction,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: logo,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      selectedTileColor: Colors.black,
      title: Text(
        text,
        style: TextStyle(color: contentColor),
      ),
      tileColor: backgroundColor,
    );
  }
}
