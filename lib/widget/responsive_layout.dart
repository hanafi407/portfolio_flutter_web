import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Color backgrounColor;
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.backgrounColor = AppColors.bgColor,
  });

  final double heigh = 590;

  @override
  Widget build(BuildContext context) {
    final size = AppSize.size(context: context);
    final hightBody = AppSize.heightBody(context: context);
    return LayoutBuilder(builder: (context, constraint) {
      bool isMoreThan590 = hightBody > heigh;
      print('hightBody:$hightBody');
      if (constraint.maxWidth < 600) {
        return Container(
          decoration: BoxDecoration(color: backgrounColor),
          width: size.width,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.03,
          ),
          child: mobile,
        );
      } else if (constraint.maxWidth < 1200) {
        // bool isHeight=constraint
        return Container(
          decoration: BoxDecoration(color: backgrounColor),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.03,
          ),
          width: size.width,
          child: tablet,
        );
      } else {
        return Container(
          decoration: BoxDecoration(color: backgrounColor),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.03,
          ),
          width: size.width,
          height: isMoreThan590 ? hightBody : null,
          child: desktop,
        );
      }
    });
  }
}
