import 'package:flutter/material.dart';

class myCustomAppBar {
  Widget leading = IconButton(icon: const Icon(Icons.menu, color: Color(0xFFFDB827),), onPressed: () {
  },);

  List<Widget> actions = [
    IconButton(onPressed: () {}, icon: const Icon(Icons.signal_cellular_4_bar, color: Color(0xFF7BD373),)),

    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Color(0xFF21209C),))
  ];

}
