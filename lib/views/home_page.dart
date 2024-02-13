import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:porfolio_flutter_web/constant/url.dart';
import 'package:porfolio_flutter_web/global/app_assets.dart';
import 'package:porfolio_flutter_web/global/app_button.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_notif.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';
import 'package:porfolio_flutter_web/global/app_style.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/widget/profile_animation.dart';
import 'package:porfolio_flutter_web/widget/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? menuIndex;
  int? indexSosMed;

  List<String> items = [
    "Home",
    "About",
    "Portfolio",
    "Service",
    "Contact",
  ];

  List<String> skills = [
    'Dart',
    'Flutter',
    'Java',
    'Spring Boot',
    "HTML",
    "CSS",
    'JavaScript',
    'ReactJs',
    'PHP',
    'Laravel',
    'CodeIgniter'
  ];

  List<String> iconSosMed = [
    AppAssets.facebook,
    AppAssets.insta,
    AppAssets.twitter,
    AppAssets.linkedIn,
    AppAssets.github,
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Column(children: [
        buildHomePageInfo(context, 0.6),
        const SizedBox(height: 10),
        // const ProfileAnimation(fontSize: 0.6)
      ]),
      tablet: Row(
        children: [
          Expanded(child: buildHomePageInfo(context, 0.6)),
          const SizedBox(height: 10),
          // const ProfileAnimation(fontSize: 0.6)
        ],
      ),
      desktop: Row(
        children: [
          Expanded(child: buildHomePageInfo(context, 1)),
          const SizedBox(height: 10),
          // const ProfileAnimation(fontSize: 1)
        ],
      ),
    );
  }

  Column buildHomePageInfo(BuildContext context, double scale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Text(
          "Hello, It's me.",
          style: AppTextStyle.montseratStyle(fontSize: 24 * scale),
        ),
        const SizedBox(height: 15),
        Text(
          "Herlambang Hanafi Aji",
          style: AppTextStyle.headerTextStyle(
            fontSize: 60 * scale,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          // width: AppSize.size(context: context).width * 0.5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "And I am Developer ",
                style: AppTextStyle.montseratStyle(fontSize: 24 * scale),
              ),
              AnimatedTextKit(
                animatedTexts: skills
                    .map(
                      (skill) => TyperAnimatedText(
                        skill,
                        textStyle: AppTextStyle.montseratStyle(
                            color: AppColors.buttonColor, fontSize: 24 * scale),
                        speed: const Duration(milliseconds: 100),
                      ),
                    )
                    .toList(),
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                repeatForever: true,
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "I am fullstack developer and I love code.",
          style: AppTextStyle.normalStyle(),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 50,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: iconSosMed.length,
            itemBuilder: (context, index) =>
                buildSocialMediaCircle(asset: iconSosMed[index], index: index),
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
          ),
        ),
        const SizedBox(height: 15),
        AppButton.buildMaterialButton(
            onPressed: () {
              _urlLauncher();
            },
            text: "Download CV"),
      ],
    );
  }

  Text buildItems({required int index}) {
    return Text(
      items[index],
      style: AppTextStyle.headerTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildSocialMediaCircle({
    required String asset,
    required int index,
  }) {
    bool hover = indexSosMed == index;
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: hover
              ? AppStyle.adjustColorBrightness(AppColors.buttonColor, 1.5)
              : AppColors.buttonColor,
        ),
        shape: BoxShape.circle,
        color: AppColors.bgColor,
      ),
      child: InkWell(
        onTap: () {},
        hoverColor: AppStyle.adjustColorBrightness(AppColors.buttonColor, 1.5),
        borderRadius: BorderRadius.circular(25),
        splashColor: AppColors.buttonColor,
        onHover: (value) {
          setState(() {
            if (value) {
              indexSosMed = index;
            } else {
              indexSosMed = null;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            asset,
            color: hover
                ? AppStyle.adjustColorBrightness(AppColors.buttonColor, 1.5)
                : AppColors.buttonColor,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void _urlLauncher() async {
    Uri url = Uri.parse(drive);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      AppNotif.showSnackBarCustom(context, "Could not download");
    }
  }
}
