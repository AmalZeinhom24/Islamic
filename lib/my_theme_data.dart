import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFF242424);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: primary,
        size: 30,
      ),
      centerTitle: true,
      elevation: 0,
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
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primary,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white),
  );
}
