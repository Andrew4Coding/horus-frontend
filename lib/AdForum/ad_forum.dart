import 'package:flutter/material.dart';
import 'package:horus_frontend/AdForum/ad_forum_create_report.dart';
import 'package:horus_frontend/Components/ad_forum_card.dart';
import 'package:horus_frontend/Components/appbar.dart';

class AdForumPage extends StatefulWidget {
  const AdForumPage({super.key});

  @override
  State<AdForumPage> createState() => _AdForumPageState();
}

class _AdForumPageState extends State<AdForumPage> {
  Future<void> _refresh() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => super.widget));
    return Future.delayed(const Duration(seconds: 1));
  }

  List sortButton = [
    ['Urgency', true],
    ['Nearest', false],
    ['Closed', false],
  ];

  List reporterUserData = [
    {
      "id": "123",
      "authorName": "Adin Wijaya",
      "authorProfilePict": "assets/logo.png",
      "timePosted": "1m ago",
      "postImage": [],
      "postTitle": "Lorem Kwik",
      "postDesc": "Lorem Ipsum Dolor Sit Amet",
      "postContent": "Hello World",
      "location": "Near Stasiun UI",
      "urgency": "urgent",
      "upCount": 10,
      "downCount": 10,
      "chatData": [
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": false,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        },
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": true,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        }
      ],
    },
    {
      "id": "123",
      "authorName": "Adin Wijaya",
      "authorProfilePict": "assets/logo.png",
      "timePosted": "1m ago",
      "postImage": <String>[
        "assets/portrait.png",
        "assets/portrait.png",
        "assets/harass.jpg"
      ],
      "postTitle": "Lorem Kwik",
      "postDesc": "Lorem Ipsum Dolor Sit Amet",
      "postContent": "Hello World",
      "location": "Near Stasiun UI",
      "urgency": "ordinary",
      "upCount": 10,
      "downCount": 10,
      "chatData": [
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": false,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        },
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": true,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        }
      ],
    },
    {
      "id": "123",
      "authorName": "Adin Wijaya",
      "authorProfilePict": "assets/logo.png",
      "timePosted": "1m ago",
      "postImage": [
        "assets/harass.jpg",
        "assets/harass.jpg",
        "assets/harass.jpg"
      ],
      "postTitle": "Lorem Kwik",
      "postDesc": "Lorem Ipsum Dolor Sit Amet",
      "postContent": "Hello World",
      "location": "Near Stasiun UI",
      "urgency": "closed",
      "upCount": 10,
      "downCount": 10,
      "chatData": [
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": false,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        },
        {
          "senderPict": "assets/logo.png",
          "sender": "Adin Wijaya",
          "thisUser?": true,
          "time": "23.57",
          "message":
              "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        }
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Ad Forum",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF21209C),
        foregroundColor: Colors.white,
        elevation: 0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateReport()));
        },
        child: Container(
          child: const Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sort By",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: sortButton.map((e) {
                return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for (List list in sortButton) {
                          list[1] = false;
                        }
                        e[1] = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: e[1] ? Colors.white : Colors.black,
                        backgroundColor: e[1]
                            ? const Color(0xFF21209C)
                            : const Color(0xFFF1F1F1)),
                    child: Container(
                      child: Text(e[0]),
                    ));
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView(
                  children: reporterUserData.map((data) {
                    return AdCard(data: data);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
