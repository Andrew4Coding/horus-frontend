import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function()? nextPageFunction;

  final Color? buttonColor;
  final Color? foreColor;

  const SubmitButton(
      {super.key,
      required this.nextPageFunction,
      required this.buttonText,
      this.buttonColor,
      this.foreColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPageFunction,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: buttonColor,
            gradient: buttonColor == null
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                        Color(0xFF504FDD),
                        Color(0xFF21209C),
                      ])
                : null),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: foreColor)),
          ),
        ),
      ),
    );
  }
}
