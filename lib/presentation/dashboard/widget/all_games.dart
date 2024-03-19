import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/screen_size.dart';
import '../../../utils/theme.dart';
import '../controller/dashboard_controller.dart';
import 'no_apps.dart';

class AllGames extends GetWidget<DashBoardController> {
  const AllGames({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileGamesSection(context),
      desktop: (BuildContext context) => DesktopGamesSection(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileGamesSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.05,
      ),
      width: ScreenSize.w,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "  All Games",
              style: CustomTextStyle.heading1(),
            ),
          ),
          20.ph,
          HorizontalScroll(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopGamesSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.1,
      ),
      //color: Colors.blue,
      width: ScreenSize.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "  All Games",
              style: CustomTextStyle.heading1(),
            ),
          ),
          20.ph,
          HorizontalScroll(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HorizontalScroll() {
    return SizedBox(
      height: ScreenSize.h * 0.32,
      child: Obx(
        () => controller.isLoading.value ? Utils.getLoader() : controller.games!.isEmpty
            ? const NoAppsAvailable()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.games!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: GameCard(context, index),
                  );
                },
              ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget GameCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: ScreenSize.h * 0.19,
      height: ScreenSize.h * 0.32,
      //color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Image.network(
                  '${controller.games![index].logo}.png',
                  width: ScreenSize.h * 0.19,
                  height: ScreenSize.h * 0.19,
                ),
              ),
              20.ph,
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(controller.games![index].appName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.heading2()),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.green,
                        size: ScreenSize.h * 0.015,
                      ),
                      2.pw,
                      Text(controller.games![index].rating.toString(),
                          style: CustomTextStyle.heading3()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
