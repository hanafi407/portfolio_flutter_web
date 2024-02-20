import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_assets.dart';
import 'package:porfolio_flutter_web/global/app_button.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_notif.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/global/app_title.dart';
import 'package:porfolio_flutter_web/widget/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class LatestProject extends StatefulWidget {
  const LatestProject({super.key});

  @override
  State<LatestProject> createState() => _LatestProjectState();
}

class _LatestProjectState extends State<LatestProject> {
  List<Map<String, dynamic>> contentLatestProject = [
    {
      'link': 'https://github.com/hanafi407/bus-reservation-spring-boot',
      'image': AppAssets.flutter,
      'title': 'Flutter',
      'body': 'Bus Reservation build with flutter.'
    },
    {
      'link': 'https://github.com/hanafi407/bus-reservation-spring-boot',
      'image': AppAssets.spring,
      'title': 'Spring Boot',
      'body': 'Bus Reservation Backend and API.'
    },
    {
      'link': 'https://github.com/hanafi407/Trian-Jaya-Shop',
      'image': AppAssets.react,
      'title': 'ReactJs',
      'body': 'Ecomerce use MERN(MongoDB, Express, React, NodeJs).'
    },
  ];

  void _urlLauncher({required String uri}) async {
    Uri url = Uri.parse(uri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      AppNotif.showSnackBarCustom(context, "Could not load");
    }
  }

  int? hoverIndex;

  final onHoverEffect = Matrix4.identity()..scale(1.0);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Column(
        children: [
          AppTitle.buildTitle(name1: "Latest", name2: "Project"),
          const SizedBox(height: 20),
          builderLatestProject(
            scale: 0.9,
            crossAxisCount: 1,
          )
        ],
      ),
      tablet: Column(
        children: [
          AppTitle.buildTitle(name1: "Latest", name2: "Project"),
          const SizedBox(height: 20),
          builderLatestProject(
            scale: 0.8,
            crossAxisCount: 2,
          )
        ],
      ),
      desktop: Column(
        children: [
          AppTitle.buildTitle(name1: "Latest", name2: "Project"),
          const SizedBox(height: 20),
          builderLatestProject(
            scale: 0.9,
            crossAxisCount: 3,
          )
        ],
      ),
    );
  }

  GridView builderLatestProject({
    required int crossAxisCount,
    double scale = 1,
  }) {
    return GridView.builder(
        itemCount: contentLatestProject.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisExtent: 200,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          final content = contentLatestProject[index];
          return Container(
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              onHover: (value) {
                setState(() {
                  if (value) {
                    hoverIndex = index;
                  } else {
                    hoverIndex = null;
                  }
                });
              },
              onTap: () {
                _urlLauncher(uri: content['link']);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.bgColor2,
                      image: DecorationImage(
                        image: AssetImage(content['image']),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // width: double.infinity,
                  ),
                  Visibility(
                    visible: hoverIndex == index,
                    child: AnimatedContainer(
                      width: double.infinity,
                      duration: const Duration(milliseconds: 600),
                      transform: hoverIndex == index ? onHoverEffect : null,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.buttonColor.withOpacity(0.8),
                            AppColors.buttonColor.withOpacity(0.7),
                            AppColors.buttonColor.withOpacity(0.6),
                            AppColors.buttonColor.withOpacity(0.5),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            content['title'],
                            style: AppTextStyle.headerTextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            content['body'],
                            style: AppTextStyle.headerTextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          AppButton.buildMaterialButton(
                            scale: scale,
                            onPressed: () {
                              _urlLauncher(uri: content['link']);
                            },
                            text: "View Code",
                            border: true,
                          )
                          // CircleAvatar(
                          //   backgroundColor: AppColors.textColor,
                          //   maxRadius: 25,
                          //   child: Image.asset(
                          //     AppAssets.share,
                          //     width: 25,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
