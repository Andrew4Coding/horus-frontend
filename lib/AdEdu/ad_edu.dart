import 'package:flutter/material.dart';
import 'package:horus_frontend/AdEdu/ad_edu_detail.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:horus_frontend/Components/submit_button.dart';

class AdEduPage extends StatefulWidget {
  const AdEduPage({super.key});

  @override
  State<AdEduPage> createState() => _AdEduPageState();
}

class _AdEduPageState extends State<AdEduPage> {
  int up_count = 10;
  int down_count = 10;

  List postData = [
    {
      "authorName": "Ad Infinitum Official",
      "authorProfilePict": "assets/logo.png",
      "timePosted": "1m ago",
      "postImage": "assets/harass.jpg",
      "postTitle": "Lorem Hehe",
      "postDesc": "Lorem Ipsum Dolor Sit Amet",
      "upCount": 10,
      "downCount": 10,
      "postContent": "Hello World"
    },
    {
      "authorName": "Ad Infinitum Official",
      "authorProfilePict": "assets/logo.png",
      "timePosted": "1m ago",
      "postImage": "assets/harass.jpg",
      "postTitle": "Lorem Ipsum",
      "postDesc": "Lorem Ipsum Dolor Sit Amet",
      "upCount": 10,
      "downCount": 10,
      "postContent": "Hello Cok"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Ad Edu",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
            children: postData.map((data) {
          return Column(
            children: [
              ExpansionTile(
                collapsedBackgroundColor: const Color(0xFFF1F1F1),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: const Color(0xFFF1F1F1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(data['authorProfilePict']),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                data["authorName"],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            data["timePosted"],
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xFFADADAD)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("assets/harass.jpg"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data['postTitle'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            data['postDesc'],
                            style: const TextStyle(
                              height: 2,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(elevation: 0),
                                  onPressed: () {
                                    setState(() {
                                      data["upCount"] += 1;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.arrow_upward,
                                        color: Color(0xFF21209C),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("${data['upCount']}K")
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(elevation: 0),
                                  onPressed: () {
                                    setState(() {
                                      data["downCount"] += 1;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.arrow_downward,
                                        color: Color(0xFF21209C),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("${data['downCount']}K")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SubmitButton(
                            nextPageFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdEduDetailPage(postData: {
                                            "postTitle": data["postTitle"],
                                            "postImage": data["postImage"],
                                            "postContent": data["postContent"]
                                          })));
                            },
                            buttonText: "Read More",
                            foreColor: Colors.white,
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
