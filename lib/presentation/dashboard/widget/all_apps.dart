import 'package:appify/presentation/dashboard/widget/no_apps.dart';
import 'package:appify/utils/routes.dart';
import 'package:appify/utils/theme.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/screen_size.dart';
import '../controller/dashboard_controller.dart';

class AllApps extends GetWidget<DashBoardController> {
  const AllApps({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileAppSection(context),
      desktop: (BuildContext context) => DesktopAppSection(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileAppSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.05,
      ),
      width: ScreenSize.w,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "  All Apps",
              style: TextStyle(fontSize: 20),
            ),
          ),
          20.ph,
          HorizontalScroll(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopAppSection(BuildContext context) {
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
              " All Apps",
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
      child: Obx(()=> controller.isLoading.value ? Utils.getLoader() :
      
      controller.apps!.isEmpty ? const NoAppsAvailable() :
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.apps!.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.details, arguments: controller.apps![index].packageName);
            },
            child: AppCard(context, index),
          );
        },
      ),)
    );
  }

  // ignore: non_constant_identifier_names
  Widget AppCard(BuildContext context, int index) {
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
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                //size: Size.fromRadius(ScreenSize.h * 0.10), // Image radius
                child: Image.network(
                  controller.apps![index].logo!,
                  fit: BoxFit.cover,
                  height: ScreenSize.h * 0.19,
                  width: ScreenSize.h * 0.19,
                ),
              ),
            ),
              ),
              20.ph,
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.apps![index].appName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.heading2(),
                      )),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green,size: ScreenSize.h * 0.015,),
                      2.pw,
                      Text(controller.apps![index].rating!.toString(),style: CustomTextStyle.heading3()),
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
