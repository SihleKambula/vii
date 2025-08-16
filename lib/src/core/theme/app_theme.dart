import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
    iconTheme: const IconThemeData(color: Colors.black),
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

  //dark theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade900,
      secondary: Colors.white,
      tertiary: Colors.grey.shade900,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
