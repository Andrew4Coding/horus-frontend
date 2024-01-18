import 'package:flutter/material.dart';
import 'package:horus_frontend/AdForum/ad_chatroom.dart';
import 'package:horus_frontend/Components/submit_button.dart';

class AdCard extends StatefulWidget {
  final Map data;

  const AdCard({super.key, required this.data});

  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  @override
  Widget build(BuildContext context) {
    Map urgencyColor = {
      "urgent": [const Color(0xFFFF5454), Colors.white],
      "ordinary": [const Color(0xFFF1F1F1), Colors.black],
      "closed": [const Color(0xFFC8C8C8), Colors.black]
    };
    return Column(
      children: [
        ExpansionTile(
          collapsedBackgroundColor: urgencyColor[widget.data['urgency']][0],
          collapsedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: urgencyColor[widget.data['urgency']][0],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.data['authorProfilePict']),
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
                          widget.data["authorName"],
                          style: TextStyle(
                              fontSize: 12,
                              color: urgencyColor[widget.data['urgency']][1],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.data["timePosted"],
                          style: TextStyle(
                            fontSize: 10,
                            color: urgencyColor[widget.data['urgency']][1],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "•",
                          style: TextStyle(
                            color: urgencyColor[widget.data['urgency']][1],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.data["location"],
                          style: TextStyle(
                            fontSize: 10,
                            color: urgencyColor[widget.data['urgency']][1],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 0, bottom: 30),
                decoration: BoxDecoration(
                    color: urgencyColor[widget.data['urgency']][0],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.data['postImage'] != [])
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: widget.data['postImage'].length != 0
                                ? Image.asset(
                                    widget.data['postImage'][0],
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  )
                                : Container(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    Text(
                      widget.data['postTitle'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: urgencyColor[widget.data['urgency']][1],
                          fontSize: 20),
                    ),
                    Text(
                      widget.data['postDesc'],
                      style: TextStyle(
                        color: urgencyColor[widget.data['urgency']][1],
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
                                widget.data["upCount"] += 1;
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
                                Text("${widget.data['upCount']}K")
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
                                widget.data["downCount"] += 1;
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
                                Text("${widget.data['downCount']}K")
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
                                    ChatRoom(reportData: widget.data)));
                      },
                      buttonText: "Join Room",
                      buttonColor: Colors.white,
                      foreColor: Colors.black,
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
  }
}
