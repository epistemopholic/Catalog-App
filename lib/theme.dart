import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNewTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        //to use property/styles of other themes, like text theme of any other theme
        //textTheme: Theme.of(context).textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      cardColor: Colors.black,
    );
  }
}
