import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_assets.dart';
import 'package:porfolio_flutter_web/global/app_button.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';
import 'package:porfolio_flutter_web/global/app_style.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/global/app_title.dart';
import 'package:porfolio_flutter_web/widget/responsive_layout.dart';

class MyService extends StatefulWidget {
  const MyService({super.key});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  int? hoverIndex;
  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  List<dynamic> contents = [
    {
      'title': 'Design',
      'asset': AppAssets.brush,
      'body':
          "I value simple content structure, clean design patterns, and thoughtful interactions.",
      'tool': 'Figma',
    },
    {
      'title': 'Frontend Developer',
      'asset': AppAssets.code,
      'body':
          "I like to code things from scratch, and enjoy bringing ideas to life in the browser and mobile.",
      'tool': 'Dart, Flutter, JavaScript, Reactjs',
    },
    {
      'title': 'Backend Developer',
      'asset': AppAssets.spring,
      'body':
          "I like backend too. especially spring boot. Beside spring boot, i could use Laravel and Node.",
      'tool': 'Java, Spring Boot, PHP, Laravel, Codeigniter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double itemHeight = AppSize.heightBody(context: context);
    final double itemWidth = AppSize.size(context: context).width;
    return ResponsiveLayout(
      backgrounColor: AppColors.bgColor2,
      mobile: Column(
        children: [
          AppTitle.buildTitle(name1: "My", name2: "Project"),
          const SizedBox(
            height: 20,
          ),
          buildGridMyService(
            crossAxisCount: 1,
            childAspectRatio: itemWidth / itemHeight,
          ),
        ],
      ),
      tablet: Column(
        children: [
          AppTitle.buildTitle(name1: "My", name2: "Project"),
          const SizedBox(
            height: 20,
          ),
          buildGridMyService(
            childAspectRatio: (itemWidth + (itemHeight * 0.5)) / itemHeight,
            crossAxisCount: 1,
          ),
        ],
      ),
      desktop: Column(
        children: [
          AppTitle.buildTitle(name1: "My", name2: "Project"),
          const SizedBox(
            height: 20,
          ),
          buildGridMyService(
            crossAxisCount: 3,
          ),
        ],
      ),
    );
  }

  Widget buildGridMyService({
    required int crossAxisCount,
    double scale = 1,
    childAspectRatio = 0.75,
  }) {
    return GridView.builder(
        itemCount: contents.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          // mainAxisExtent: null,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  if (value) {
                    hoverIndex = index;
                  } else {
                    hoverIndex = null;
                  }
                });
              },
              child: buildAnimatedContainer(
                content: contents[index],
                isHover: hoverIndex == index,
                scale: scale,
              ),
            ));
  }

  Widget buildAnimatedContainer({
    required Map content,
    bool isHover = false,
    double scale = 1,
  }) {
    double heightBody = 595;
    return AnimatedContainer(
      transform: isHover ? onHoverActive : onHoverRemove,
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: isHover ? AppStyle.adjustColorBrightness(AppColors.bgColor, 1.5) : AppColors.bgColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4,
            blurRadius: 4.5,
            offset: Offset(3, 4.5),
          ),
        ],
      ),
      // width: 318,
      // height: (heightBody * 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Image.asset(
                content['asset'],
                width: (heightBody * 0.1) * scale,
                color: AppColors.textColor,
              ),
              SizedBox(height: (heightBody * 0.01)),
              Text(
                content['title'],
                style: AppTextStyle.headerTextStyle(
                  fontSize: 24,
                  scale: scale,
                ),
              ),
              SizedBox(height: (heightBody * 0.01)),
              Text(
                content['body'],
                style: AppTextStyle.normalStyle(
                  scale: scale,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Tools',
            style: AppTextStyle.headerTextStyle(
              fontSize: 22,
              scale: scale,
            ),
          ),
          Text(
            content['tool'],
            style: AppTextStyle.normalStyle(
              scale: scale,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: (heightBody * 0.05)),
        ],
      ),
    );
  }
}
