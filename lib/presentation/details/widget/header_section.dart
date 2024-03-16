import 'package:appify/utils/screen_size.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../reusables/custom_text_button.dart';
import '../controller/details_controller.dart';

class HeaderSection extends GetWidget<DetailsController> {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileHeaderSection(context),
      desktop: (BuildContext context) => DesktopHeaderSection(context),
    );
  }

  Widget MobileHeaderSection(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 250, 250, 249),
      padding:
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.06, vertical: 40),
      child: Column(
        children: [
          App(),
          20.ph,
          CommonButton(
            title: 'Install',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onPressed: () {},
            width: double.infinity,
          ),
          20.ph,
          Photos(),
        ],
      ),
    );
  }

  Widget DesktopHeaderSection(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 250, 250, 249),
      padding:
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.1, vertical: 20),
      height: ScreenSize.w >= 1280 ? ScreenSize.h * 0.6 : ScreenSize.h * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              App(),
              20.pw,
              ScreenSize.w >= 1280
                  ? Expanded(child: Photos())
                  : CommonButton(
                      title: 'Install',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                      width: ScreenSize.w * 0.2,
                    ),
            ],
          ),
          ScreenSize.w >= 1280 ? Container() : Expanded(child: Photos()),
        ],
      ),
    );
  }

  Widget App() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(50), // Image radius
                  child: Image.network(
                    'https://cdn.shopify.com/app-store/listing_images/ca1f1238d808935b77771b399df6e9ab/icon/CLe6nrP0lu8CEAE=.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
            20.pw,
            const Text('Ashwin')
          ],
        ),
        20.ph,
        const Text(
          'Free to install. Additional charges may apply.',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text('Rating'),
                Row(
                  children: [
                    Text('4.8'),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            10.pw,
            Container(
              height: 50,
              child: const VerticalDivider(
                color: Colors.grey,
                width: 1,
              ),
            ),
            10.pw,
            const Column(
              children: [
                Text('Reviews'),
                Text('1000'),
              ],
            ),
            10.pw,
            Container(
              height: 50,
              child: const VerticalDivider(
                color: Colors.grey,
                width: 1,
              ),
            ),
            10.pw,
            const Column(
              children: [
                Text('Developer'),
                Text('Ashwin Navange'),
              ],
            ),
          ],
        ),
        20.ph,
        ScreenSize.w >= 1280
            ? CommonButton(
                title: 'Install',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {},
                width: ScreenSize.w * 0.2,
              )
            : Container(),
      ],
    );
  }

  Widget Photos() {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical:  16),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
                'https://play-lh.googleusercontent.com/tNuMAclO_TrRn5RbiSo2iU2ySljFaHjCIWoMUSoemUcl4FjTyVO0PpJZL_zTrYf7v_4=w2560-h1440-rw'),
          );
        },
      ),
    );
  }
}
