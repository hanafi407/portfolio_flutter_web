import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';

class AppTitle {
  static RichText buildTitle({required String name1, String? name2,double size=1}) {
    return RichText(
      text: TextSpan(
        text: name2 == null ? name1 : "$name1 ",
        style: AppTextStyle.headerTextStyle(
            color: AppColors.textColor, fontWeight: FontWeight.w900, fontSize: 45*size),
        children: [
          TextSpan(
              text: name2,
              style: AppTextStyle.headerTextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w900, fontSize: 45*size))
        ],
      ),
    );
  }
}
