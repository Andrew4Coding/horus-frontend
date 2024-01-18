import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';

class AdEduDetailPage extends StatelessWidget {
  final Map postData;

  const AdEduDetailPage({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Edu Detail",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Image.asset(postData['postImage']),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  postData['postTitle'],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  postData['postContent'],
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
