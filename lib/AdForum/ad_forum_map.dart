import 'package:flutter/material.dart';

class MapOpenedPage extends StatelessWidget {
  final Map reportData;
  const MapOpenedPage({super.key, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Map Opened",
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
          ]),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.grey,
            child: Container(
                // THIS IS THE MAP CONTAINER
                ),
          )),
          ExpansionTile(
            collapsedBackgroundColor: const Color(0xFFF1F1F1),
            backgroundColor: const Color(0xFFF1F1F1),
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        reportData['postDesc'],
                        style: const TextStyle(height: 2, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
