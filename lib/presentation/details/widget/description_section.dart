import 'dart:math';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/screen_size.dart';
import '../../../utils/theme.dart';
import '../controller/details_controller.dart';

class DescriptionSection extends GetWidget<DetailsController> {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileDescriptionSection(context),
      desktop: (BuildContext context) => DesktopDescriptionSection(context),
    );
  }

  Widget MobileDescriptionSection(context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.07, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescriptionWidget(),
          30.ph,
          HighlightAndAbout(),
        ],
      ),
    );
  }

  Widget DesktopDescriptionSection(context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.1, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightAndAbout(),
          (ScreenSize.w * 0.045).pw,
          Expanded(child: DescriptionWidget()),
        ],
      ),
    );
  }

  Widget HighlightAndAbout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Highlights',
          style: CTS.h1(20),
        ),
        10.ph,
        HighlightCard(Icons.query_stats, 'Discover, Download and Delve!',
            'Empowering your digital journey, one tap at a time.'),
        10.ph,
        HighlightCard(Icons.public, 'Effortless efficiency, anytime, anywhere!',
            'Navigate with Confidence, Explore with Ease!'),
        30.ph,
        Text(
          'About this app',
          style: CTS.h1(20),
        ),
        10.ph,
        Text(
          'Launched',
          style: CTS.h2(15),
        ),
        4.ph,
        Text(controller.app!.value.createdAt ?? 'N/A',
            style: CTS.h3(14)),
        10.ph,
        Text(
          'Package Name',
          style: CTS.h2(15),
        ),
        4.ph,
        Text(controller.app!.value.packageName ?? 'N/A',
            style: CTS.h3(14)),
        10.ph,
        Text(
          'Version',
          style: CTS.h2(15),
        ),
        4.ph,
        Text(controller.app!.value.version ?? 'N/A',
            style: CTS.h3(14)),
        30.ph,
        Text(
          'Categories',
          style: CTS.h1(20),
        ),
        10.ph,
        Container(
          width: ScreenSize.w >= 1280
              ? ScreenSize.w * 0.25
              : ScreenSize.w >= 950
                  ? ScreenSize.w * 0.5
                  : ScreenSize.w,
          height: 70,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: min(3, controller.app!.value.categories!.length),
            itemBuilder: (context, index) {
              return Text(controller.app!.value.categories![index],
                  style: CTS.h2(14));
            },
          ),
        )
      ],
    );
  }

  Widget HighlightCard(IconData icon, String title, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        10.pw,
        ScreenSize.w < 950 ? Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CTS.h2(15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                desc,
                style: CTS.h3(14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ) : 
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CTS.h2(15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                desc,
                style: CTS.h3(14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
      ],
    );
  }

  Widget DescriptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(
        child: Text(
          'Description',
          style: CTS.h1(20),
        ),
        alignment: Alignment.centerLeft,
      ),
      15.ph,
      Text(
        controller.app!.value.description ?? 'N/A',
        style:
            CTS.h3(18),
      ),
      30.ph,
      Align(
        child: Text(
          'What\'s New',
          style: CTS.h1(20),
        ),
        alignment: Alignment.centerLeft,
      ),
      15.ph,
      Align(
        child: Text(controller.app!.value.whatsNew ?? 'N/A',
            style: CTS.h3(18)),
        alignment: Alignment.centerLeft,
      ),
    ]);
  }
}
