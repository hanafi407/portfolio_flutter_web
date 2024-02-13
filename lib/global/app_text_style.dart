import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';

class AppTextStyle {
  static TextStyle headerTextStyle({
    Color color = AppColors.textColor,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w600,
    double scale = 1,
  }) {
    return GoogleFonts.signikaNegative(
      fontSize: fontSize * scale,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle montseratStyle({
    Color color = AppColors.textColor,
    double fontSize = 24,
    double scale = 1,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize*scale,
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  static TextStyle headingStyle({
    double fonstSize = 36,
    Color color = AppColors.textColor,
    double scale = 1,
  }) {
    return GoogleFonts.rubikMoonrocks(
      fontSize: fonstSize*scale,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyle({
    Color color = AppColors.textColor,
    double fontSize = 16,
    double scale = 1,
  }) {
    return TextStyle(
      
      fontWeight: FontWeight.w500,
      fontSize: fontSize*scale,
      color: color,
      letterSpacing: 1.7,
      height: 1.5,
    );
  }
}
