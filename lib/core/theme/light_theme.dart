import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.robotoMonoTextTheme(),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
  ),
);
