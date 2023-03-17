import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static String get title => "Lista de contatos";

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
        scaffoldBackgroundColor: const Color(0xffdadada),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff005f6b)),
        primaryColor: const Color(0xff008c9e),
        primaryColorDark: const Color(0xff005f6b),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff343838),
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      );
}
