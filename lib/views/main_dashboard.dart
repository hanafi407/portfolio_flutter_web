import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';
import 'package:porfolio_flutter_web/global/app_text_style.dart';
import 'package:porfolio_flutter_web/views/about_me.dart';
import 'package:porfolio_flutter_web/views/contact.dart';
import 'package:porfolio_flutter_web/views/footer.dart';
import 'package:porfolio_flutter_web/views/home_page.dart';
import 'package:porfolio_flutter_web/views/latest_project.dart';
import 'package:porfolio_flutter_web/views/my_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int? menuIndex;
  int? indexSosMed;

  List<String> items = ["Home", "About", "Latest Project", "Service", "Contact"];

  final List<Widget> listScreen = [
    const HomePage(),
    const AboutMe(),
    const LatestProject(),
    const MyService(),
    const Contact(),
    const Footer(),
  ];

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ScrollOffsetListener _scrollOffsetListener = ScrollOffsetListener.create();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  Future<void> scrollTo(int index) async {
    _itemScrollController
        .scrollTo(
      index: index,
      duration: const Duration(seconds: 2),
      curve: Curves.ease,
    )
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     _scrollController.animateTo(0,
        //         duration: const Duration(milliseconds: 500), curve: Curves.ease);
        //   },
        //   child: const Icon(Icons.arrow_upward),
        // ),
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          toolbarHeight: AppSize.heightBody(context: context) * 0.1,
          // titleSpacing: 100,
          backgroundColor: AppColors.bgColor,
          elevation: 2,
          title: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.size(context: context).width * 0.1),
              child: LayoutBuilder(
                builder: (context, constraint) {
                  if (constraint.maxWidth < 700) {
                    return Row(
                      children: [
                        Text(
                          "Portfolio",
                          style: AppTextStyle.headerTextStyle(),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                            position: PopupMenuPosition.under,
                            color: AppColors.bgColor2,
                            itemBuilder: (context) => items
                                .asMap()
                                .entries
                                .map((item) => PopupMenuItem(
                                      onTap: () {
                                        scrollTo(item.key);
                                      },
                                      child: Text(
                                        item.value,
                                        style: AppTextStyle.normalStyle(),
                                      ),
                                    ))
                                .toList())
                      ],
                    );
                  } else {
                    return Row(children: [
                      Text(
                        "Portfolio",
                        style: AppTextStyle.headerTextStyle(),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 25),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              scrollTo(index);
                            },
                            onHover: (value) {
                              setState(() {
                                if (value) {
                                  menuIndex = index;
                                } else {
                                  menuIndex = null;
                                }
                              });
                            },
                            child: Transform.scale(
                              scale: menuIndex == index ? 1.2 : 1.0,
                              child: buildItems(index: index),
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }
                },
              )),
        ),
        body: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemCount: listScreen.length,
            itemPositionsListener: _itemPositionsListener,
            scrollOffsetListener: _scrollOffsetListener,
            itemBuilder: (context, index) {
              return listScreen[index];
            }));
  }

  Widget buildItems({required int index}) {
    return Text(
      items[index],
      style: AppTextStyle.headerTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
