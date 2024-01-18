import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:horus_frontend/Components/submit_button.dart';
import 'package:horus_frontend/Profile/editProfile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 49,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 12, color: Color(0xFFC8C8C8)),
            ),
            const Text(
              "Adin Wijaya",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Mobile",
              style: TextStyle(fontSize: 12, color: Color(0xFFC8C8C8)),
            ),
            const Text(
              "+62 0812 3456 7890",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 12, color: Color(0xFFC8C8C8)),
            ),
            const Text(
              "cuteadin@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "About me",
              style: TextStyle(fontSize: 12, color: Color(0xFFC8C8C8)),
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
              style: TextStyle(fontSize: 15, height: 2, color: Colors.black),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: SubmitButton(
                      buttonText: "Edit Profile",
                      foreColor: Colors.white,
                      nextPageFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfilePage()));
                      }),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
