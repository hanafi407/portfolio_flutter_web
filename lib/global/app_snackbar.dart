import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';

class AppSnackbar {
  static showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.buttonColor,
        content: Text(content),
      ),
    );
  }
}
