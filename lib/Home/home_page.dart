import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:horus_frontend/Components/horus_sidebar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDB827),
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Homepage",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: 150,
          width: 150,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFFFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/horus.png",
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
          )),
      drawer: const HorusSideBar(
        currentPageIndex: 0,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
