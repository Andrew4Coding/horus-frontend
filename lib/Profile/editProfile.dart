import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:horus_frontend/Components/input_field.dart';
import 'package:horus_frontend/Components/submit_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 49,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                ),
                Positioned(
                  right: -10,
                  bottom: -3,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFFFCA5A)), // <-- Button color
                      // overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                      //   if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
                      // }),
                    ),
                    child: const Icon(
                      Icons.filter,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const InputField(placeholder: "Ad Infinitum", isThereIcon: false),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const InputField(
                placeholder: "cuteadin@gmail.com", isThereIcon: false),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "About me",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const InputField(
                placeholder: "Lorem Ipsum Dolor Sit Amet", isThereIcon: false),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: SubmitButton(
                      buttonText: "Save Changes",
                      foreColor: Colors.white,
                      nextPageFunction: () {}),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
