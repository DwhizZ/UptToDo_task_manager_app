import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle get subHeaderStyle => GoogleFonts.lato(
        fontSize: 32,
      );

  static TextStyle get bodyStyle => GoogleFonts.lato(
        fontSize: 16,
      );
}
