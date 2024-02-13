import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_style.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';

class AppButton {
  static MaterialButton buildMaterialButton(
      {required void Function()? onPressed,
      required String text,
      double scale = 1,
      bool border = false,}) {
    return MaterialButton(
      elevation: 6,
      focusElevation: 12,
      hoverColor:
          border ? AppColors.bgColor : AppStyle.adjustColorBrightness(AppColors.buttonColor, 1.1),
      splashColor: AppColors.splashColor,
      minWidth: 130 * scale,
      padding: EdgeInsets.symmetric(horizontal: 22 * scale, vertical: 10 * scale),
      height: 55 * scale,
      color: border ? null : AppColors.buttonColor,
      onPressed: onPressed,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30 * scale),
        borderSide: border
            ? const BorderSide(
                width: 2,
                color: AppColors.bgColor,
              )
            : BorderSide.none,
      ),
      child: Text(
        text,
        style: AppTextStyle.headerTextStyle(color: AppColors.textColor, fontSize: 22 * scale),
      ),
    );
  }
}
