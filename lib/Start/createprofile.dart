import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/input_field.dart';
import 'package:horus_frontend/Components/submit_button.dart';
import 'package:horus_frontend/Home/home_page.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/blueheader.png"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text(
                    "Create",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                shape: MaterialStateProperty.all(
                                    const CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(
                                        0xFFFFCA5A)), // <-- Button color
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
                        height: 20,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const InputField(placeholder: "Name", isThereIcon: false),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const InputField(
                          placeholder: "Email", isThereIcon: false),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "About Me",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const InputField(
                          placeholder: "About Me", isThereIcon: false),
                      const SizedBox(
                        height: 20,
                      ),
                      SubmitButton(
                        nextPageFunction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homepage()));
                        },
                        buttonText: "Start",
                        foreColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
