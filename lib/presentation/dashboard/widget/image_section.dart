import 'dart:math';

import 'package:appify/utils/routes.dart';
import 'package:appify/utils/theme.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/screen_size.dart';
import '../controller/dashboard_controller.dart';
import 'no_apps.dart';
import 'text_loop.dart';

class ImageSection extends GetWidget<DashBoardController> {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileImageSection(context),
      desktop: (BuildContext context) => DesktopImageSection(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileImageSection(BuildContext context) {
    return SizedBox(
      width: ScreenSize.w,
      child: Center(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: ScreenSize.h * 0.3,
            child: Image.asset(
              'images/dashboard_bgi.png',
              fit: BoxFit.cover,
              width: ScreenSize.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.w * 0.05,
                  vertical: ScreenSize.h * 0.08,
                ),
                child: const AnimatedTextWidget(
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.w * 0.017,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 214, 211, 209),
                  ),
                  color: const Color.fromARGB(255, 250, 250, 249),
                ),
                child: HeadBoxContent(),
              ),
            ],
          ),
        ],
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopImageSection(BuildContext context) {
    return SizedBox(
      width: ScreenSize.w,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: ScreenSize.h * 0.2,
            child: Image.asset(
              'images/dashboard_bgi.png',
              fit: BoxFit.cover,
              width: ScreenSize.w * 1.1,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: ScreenSize.w * 0.1,
                    top: ScreenSize.h * 0.08,
                    bottom: ScreenSize.h * 0.08),
                child: const AnimatedTextWidget(
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.w * 0.06,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.w * 0.008,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 214, 211, 209),
                    ),
                    color: const Color.fromARGB(255, 250, 250, 249),
                  ),
                  child: HeadBoxContent(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HeadBoxContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.h * 0.05, horizontal: ScreenSize.w * 0.035),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular across Appify",
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyle.heading1(),
            ),
          ),
          20.ph,
          Obx(
            () => controller.isLoading.value
                ? Utils.getLoader()
                : controller.apps!.isEmpty
                    ? const NoAppsAvailable()
                    : GridView.builder(
                        itemCount: min(6, controller.apps!.length),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              500, // Maximum width of each grid item
                          childAspectRatio:
                              3.2, // Aspect ratio of each grid item
                          mainAxisSpacing: 15, // Spacing between rows
                          crossAxisSpacing: 15, // Spacing between columns
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.details,
                                    arguments:
                                        controller.apps![index].packageName!);
                              },
                              child: HeaderContentCard(context, index));
                        },
                      ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HeaderContentCard(BuildContext context, int index) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 214, 211, 209),
              ),
              color: const Color.fromARGB(255, 250, 250, 249),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: Size.fromRadius(ScreenSize.h * 0.03), // Image radius
                child: Image.network(
                  controller.apps![index].logo!,
                  fit: BoxFit.cover,
                  height: ScreenSize.h * 0.1,
                  width: ScreenSize.h * 0.1,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          //width: ScreenSize.w > 1350 ? ScreenSize.w * 0.12 : ScreenSize.w > 700 ? ScreenSize.w * 0.25 : ScreenSize.w * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.apps![index].appName!,
                style: CustomTextStyle.heading2(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(controller.apps![index].rating.toString(),
                      style: CustomTextStyle.heading3()),
                  2.pw,
                  Icon(
                    Icons.star,
                    color: Colors.green,
                    size: ScreenSize.h * 0.015,
                  ),
                  Text(' • ', style: CustomTextStyle.heading3()),
                  Expanded(
                    child: Text('Free to install',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.heading3()),
                  ),
                ],
              ),
              Text(controller.apps![index].shortDescription!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.heading3()),
            ],
          ),
        )
      ],
    );
  }
}
