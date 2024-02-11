
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutuku/constants/base_colors.dart';

class BaseText {
  static Text buildTextTitle(
    String title,
    double size,
  ) {
    return Text(title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: kuTuKuTextColor, fontWeight: FontWeight.bold, fontSize: size),
        ));
  }

  static Text buildTextSubTitleLight(
    String title,
    double size,
  ) {
    return Text(title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: kuTuKuHoverColor, fontWeight: FontWeight.bold, fontSize: size),
        ));
  }
}
