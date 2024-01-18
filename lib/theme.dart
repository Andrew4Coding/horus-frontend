import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.light(
        background: Color(0xFFFFFFFF),
        primary: Color(0xFF504FDD),
        onPrimary: Color(0xFF21209C),
        secondary: Color(0xFFFDB827)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF272727),
        primary: Color(0xFF504FDD),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFFDB827)));
