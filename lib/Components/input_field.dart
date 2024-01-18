import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final bool isThereIcon;
  final TextEditingController? controller;

  const InputField(
      {super.key,
      required this.placeholder,
      required this.isThereIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          prefixIcon: (isThereIcon
              ? const Icon(
                  Icons.call,
                  color: Color(0xFFFDB827),
                )
              : null),
          border: null,
          contentPadding: const EdgeInsets.all(20.0),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          hintText: placeholder,
          // icon: const Icon(Icons.call, color: Colors.orange),
          hintStyle: const TextStyle(fontSize: 15, color: Colors.black38)),
    );
  }
}
