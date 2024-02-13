import 'package:flutter/material.dart';

class AppSize {
  static Size size({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }

  static double heightBody({required BuildContext context}) {
    final mySize = size(context: context);
    final sizeAppBar = mySize.height * 0.1;
    return mySize.height - sizeAppBar;
  }

  static double textScale(BuildContext context,double fontSize) {
   return MediaQuery.of(context).textScaler.scale(fontSize);
  }
}
