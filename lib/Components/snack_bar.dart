import 'package:flutter/material.dart';

class HorusSnackBar extends StatelessWidget {
  final Color fgColor;
  final String message;

  final bool status;

  const HorusSnackBar(
      {super.key,
      required this.fgColor,
      required this.message,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            status ? Icons.check : Icons.close,
            color: fgColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Wrap(children: [
            Text(
              message,
              style: TextStyle(color: fgColor, overflow: TextOverflow.ellipsis),
            ),
          ])
        ],
      ),
    );
  }
}
