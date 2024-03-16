import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/screen_size.dart';
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
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.1, vertical: 20),
      height: ScreenSize.h * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HighlightAndAbout(),
          130.pw,
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
        Text('Highlights'),
        10.ph,
        HighlightCard(Icons.check, 'Built for your business',
            'Use directly in Shopify admin'),
        10.ph,
        HighlightCard(Icons.check, 'Built for your business',
            'Use directly in Shopify admin'),
        30.ph,
        Text('About this app'),
        10.ph,
        Text('Launched'),
        10.ph,
        Text('October 14, 2020'),
        15.ph,
        Text('Categories'),
        10.ph,
        Container(
          width: 100,
          height: 70,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Text('Category $index');
            },
          ),
        )
      ],
    );
  }

  Widget HighlightCard(IconData icon, String title, String desc) {
    return Row(
      children: [
        Icon(icon),
        10.pw,
        Column(
          children: [Text(title), Text(desc)],
        )
      ],
    );
  }

  Widget DescriptionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(child: Text('Description'),alignment: Alignment.centerLeft,),
      15.ph,
      Text(
          'The TikTok App on Shopify makes it easy to get your business in front of billions of highly engaged consumers. These users arent just browsing — theyre buying; as referenced by the popular hashtag #TikTokMadeMeBuyIt. And they could become your next customer. With the TikTok App, you can effortlessly create TikTok ad campaigns, sync your product catalog, and sell products through in-feed videos and LIVE broadcasts on TikTok Shop.', maxLines: 20,overflow: TextOverflow.ellipsis,),
      30.ph,
      Align(child: Text('What\'s New'),alignment: Alignment.centerLeft,),
      15.ph,
      Text('▶ Addition of a new Teammate [Shattered Pride] Vicente \n ▶ Addition of a new Other Story \n ▶ White Day Celebration Check-in Event \n - White Day Celebration One-Fifth Matchers Event')
    ]);
  }
}
