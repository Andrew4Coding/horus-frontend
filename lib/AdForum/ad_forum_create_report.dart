import 'package:flutter/material.dart';
import 'package:horus_frontend/AdForum/ad_forum.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:horus_frontend/Components/input_field.dart';
import 'package:horus_frontend/Components/submit_button.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = ["assets/harass.jpg"];

    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Create Report",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const InputField(placeholder: "Urgency!", isThereIcon: false),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Reporter Description",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const InputField(
                placeholder: "Lorem Ipsum Dolor Sit Amet", isThereIcon: false),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add Media",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFFFDB827)),
                    onPressed: () {},
                    icon: const Icon(Icons.add)),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: imageList.map((e) {
                    return Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(e, fit: BoxFit.fill),
                    );
                  }).toList(),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your Location",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: const Center(
                child: Text(
                  "THIS IS THE MAP",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            SubmitButton(
              nextPageFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdForumPage()));
              },
              buttonText: "Report",
              foreColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
