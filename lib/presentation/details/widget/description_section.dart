import 'dart:math';

import 'package:appify/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          (ScreenSize.w * 0.125).pw,
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
          style: CustomTextStyle.heading1(fontSize: 20),
        ),
        10.ph,
        HighlightCard(Icons.check, 'Built for your business',
            'Download Now and get started!'),
        10.ph,
        HighlightCard(Icons.check, 'Built for your business',
            'Download Now and get started!'),
        30.ph,
        Text(
          'About this app',
          style: CustomTextStyle.heading1(fontSize: 20),
        ),
        10.ph,
        Text(
          'Launched',
          style: CustomTextStyle.heading3(
              fontSize: 16, fontWeight: FontWeight.w800),
        ),
        4.ph,
        Text(controller.app!.value.createdAt ?? 'N/A',
            style: CustomTextStyle.heading3(
                fontSize: 15, fontWeight: FontWeight.w500)),
        10.ph,
        Text(
          'Package Name',
          style: CustomTextStyle.heading3(
              fontSize: 16, fontWeight: FontWeight.w800),
        ),
        4.ph,
        Text(controller.app!.value.packageName ?? 'N/A',
            style: CustomTextStyle.heading3(
                fontSize: 15, fontWeight: FontWeight.w500)),
        10.ph,
        Text(
          'Version',
          style: CustomTextStyle.heading3(
              fontSize: 16, fontWeight: FontWeight.w800),
        ),
        4.ph,
        Text(controller.app!.value.version ?? 'N/A',
            style: CustomTextStyle.heading3(
                fontSize: 15, fontWeight: FontWeight.w500)),
        30.ph,
        Text(
          'Categories',
          style: CustomTextStyle.heading1(fontSize: 20),
        ),
        10.ph,
        Container(
          width: 100,
          height: 70,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: min(3, controller.app!.value.categories!.length),
            itemBuilder: (context, index) {
              return Text(controller.app!.value.categories![index],
                  style: CustomTextStyle.heading3(
                      fontSize: 16, fontWeight: FontWeight.w800));
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.heading3(
                  fontSize: 16, fontWeight: FontWeight.w800),
            ),
            Text(
              desc,
              style: CustomTextStyle.heading3(
                  fontSize: 15, fontWeight: FontWeight.w500),
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
          style: CustomTextStyle.heading1(fontSize: 20),
        ),
        alignment: Alignment.centerLeft,
      ),
      15.ph,
      Text(
        controller.app!.value.description ?? 'N/A',
        maxLines: 20,
        overflow: TextOverflow.ellipsis,
        style:
            CustomTextStyle.heading3(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      30.ph,
      Align(
        child: Text(
          'What\'s New',
          style: CustomTextStyle.heading1(fontSize: 20),
        ),
        alignment: Alignment.centerLeft,
      ),
      15.ph,
      Align(
        child: Text(controller.app!.value.whatsNew ?? 'N/A',
            style: CustomTextStyle.heading3(
                fontSize: 18, fontWeight: FontWeight.w500)),
        alignment: Alignment.centerLeft,
      ),
    ]);
  }
}
