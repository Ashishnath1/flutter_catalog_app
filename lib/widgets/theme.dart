import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      canvasColor: creamColor,
      primaryColorDark: darkBluishColor,
      primaryColor: darkBluishColor,
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
      )
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      primaryColorDark: lightBluishColor,
      primaryColor: Colors.white,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      )
  );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}