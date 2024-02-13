import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_assets.dart';
import 'package:porfolio_flutter_web/global/app_button.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/global/app_title.dart';
import 'package:porfolio_flutter_web/widget/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        backgrounColor: AppColors.bgColor2,
        mobile: Column(
          children: [
            AppTitle.buildTitle(name1: "About", name2: "Me", size: 0.6),
            const SizedBox(height: 8),
            buildProfile(0.6),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildInfo(0.6),
            ),
          ],
        ),
        tablet: Column(
          children: [
            AppTitle.buildTitle(name1: "About", name2: "Me"),
            const SizedBox(height: 10),
            buildProfile(0.6),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildInfo(0.6),
            ),
          ],
        ),
        desktop: Column(
          children: [
            AppTitle.buildTitle(name1: "About", name2: "Me"),
            const SizedBox(height: 10),
            buildProfile(0.6),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildInfo(0.6),
            ),
          ],
        ));
  }

  Column buildInfo(double size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Hanafi. Nice to meet you.",
          style: AppTextStyle.montseratStyle(fontSize: 28 * size),
        ),
        const SizedBox(height: 10),
        Text(
          "Since I entered college majoring in Informatics Engineering, I began to get acquainted with coding and started to enjoy it. I started learning several programming languages during my studies. In college, I began coding using the PHP programming language and the frameworks like Codeigniter and Laravel. I also learned JavaScript and ReactJs. After graduating from college, I got to know Flutter through programmer friends and started learning Flutter. I also became familiar with Java because I enjoy watching the Programmer Zaman Now YouTube channel and began learning Spring Boot.",
          style: AppTextStyle.normalStyle(fontSize: 24 * size),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        // AppButton.buildMaterialButton(text: "Read more", onPressed: () {}),
      ],
    );
  }

  Widget buildProfile(double size) {
    return Container(
        height: 440 * size,
        width: 440 * size,
        decoration: BoxDecoration(
          border: Border.all(width: 8 * size, color: AppColors.buttonColor),
          borderRadius: BorderRadius.circular(220),
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.bgColor,
          backgroundImage: AssetImage(
            AppAssets.hanafi,
          ),
          radius: 220,

          // child: Transform.translate(
          //   offset: const Offset(0, 0),
          //   child: ClipOval(
          //     child: Image.asset(
          //       AppAssets.hanafi,
          //       width: 440,
          //       height: 440,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ));
  }
}
