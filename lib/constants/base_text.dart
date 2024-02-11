
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
          textStyle: TextStyle(color: evShopTextColor, fontWeight: FontWeight.bold, fontSize: size),
        ));
  }

  static Text buildTextSubTitleLight(
    String title,
    double size,
  ) {
    return Text(title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: evShopHoverColor, fontWeight: FontWeight.bold, fontSize: size),
        ));
  }
}
