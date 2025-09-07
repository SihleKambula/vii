import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: const Color.fromARGB(255, 236, 236, 236),
    colorScheme: ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.white,
      tertiary: const Color.fromARGB(71, 255, 255, 255),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
