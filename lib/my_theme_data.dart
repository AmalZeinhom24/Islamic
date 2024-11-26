import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF0F1424);
  static const Color yellowColor = Color(0xFFFACC1D);
  static const Color blackColor = Color(0xFF242424);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: blackColor,
        secondary: Colors.deepOrangeAccent,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: primary,
        onBackground: Colors.grey,
        surface: Colors.white,
        onSurface: Colors.white),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primary,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white),
  );
//****************************************************************************
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimary,
        onPrimary: Colors.white,
        secondary: Colors.deepOrangeAccent,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: yellowColor,
        onBackground: Colors.grey,
        surface: Colors.blueGrey,
        onSurface: Colors.white),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimary,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white),
  );

}
