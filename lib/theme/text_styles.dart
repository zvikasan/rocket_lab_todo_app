import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';

class TextStyles {
  static TextStyle large = GoogleFonts.inter(
    fontSize: 40,
    color: ThemeColors.text,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      const Shadow(
        offset: Offset(3, 3),
        blurRadius: 3.0,
        color: Colors.black12,
      ),
    ],
  );
  static TextStyle regular =
      GoogleFonts.inter(fontSize: 25, color: ThemeColors.text);
  static TextStyle small =
      GoogleFonts.inter(fontSize: 18, color: ThemeColors.text);
}
