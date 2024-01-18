import 'package:flutter/material.dart';
import 'package:horus_frontend/AdForum/ad_forum_map.dart';
import 'package:horus_frontend/Components/input_field.dart';
import 'package:horus_frontend/Components/show_image.dart';

class ChatRoom extends StatefulWidget {
  final Map reportData;

  const ChatRoom({super.key, required this.reportData});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List chatDataList = [
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
  ];

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Chat Room",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.signal_cellular_4_bar,
                  color: Color(0xFF7BD373),
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapOpenedPage(
                                reportData: widget.reportData,
                              )));
                },
                icon: Icon(
                  Icons.map,
                  color: Color(0xFF21209C),
                ))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ExpansionTile(
              collapsedBackgroundColor: const Color(0xFFF1F1F1),
              backgroundColor: const Color(0xFFF1F1F1),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Reporter Description",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.reportData['postDesc'],
                        style: const TextStyle(height: 2, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (widget.reportData['postImage']!.length != 0)
                        SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.reportData['postImage']
                                .map<Widget>((image) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      child: Image.asset(image,
                                          width: 100,
                                          height: double.infinity,
                                          fit: BoxFit.cover),
                                    ),
                                    onTap: () {
                                      print("object");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ShowImage(
                                                    imageLocation:
                                                        widget.reportData[
                                                            'postImage'],
                                                  )));
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      else
                        Container(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              color: const Color(0xFFF1F1F1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: chatDataList.length,
                  itemBuilder: (context, index) {
                    final item = chatDataList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: item['thisUser?']
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!item['thisUser?']!)
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 230),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: item['thisUser?']
                                  ? const Color(0xFF21209C)
                                  : const Color(0xFFFDB827),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!item['thisUser?'])
                                    Text(item['sender'],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  Text(
                                    item['message'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: item['thisUser?']
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    child: InputField(
                        controller: messageController,
                        placeholder: "Enter your message",
                        isThereIcon: false)),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    child: IconButton(
                  color: const Color(0xFF21209C),
                  padding: const EdgeInsets.all(20),
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    print(chatDataList);
                    if (messageController.text == '') {
                    } else {
                      setState(() {
                        chatDataList.add({
                          "senderPict": "assets/logo.png",
                          "sender": "Fitum",
                          "thisUser?": true,
                          "time": "23.58",
                          "message": messageController.text,
                        });
                      });
                      messageController.clear();
                    }
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
