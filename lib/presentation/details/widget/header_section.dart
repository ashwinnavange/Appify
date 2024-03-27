import 'dart:math';

import 'package:appify/utils/screen_size.dart';
import 'package:appify/utils/theme.dart';
import 'package:appify/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            title: 'Download',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              controller.downloadAPK(controller.app!.value.appFile!);
            },
            width: double.infinity,
          ),
          20.ph,
          Photos(),
        ],
      ),
    );
  }

  Widget DesktopHeaderSection(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 250, 250, 249),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.w * 0.1, vertical: 20),
          //height: ScreenSize.w >= 1280 ? ScreenSize.h * 0.65 : ScreenSize.h * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              App(),
              60.pw,
              ScreenSize.w >= 1280
                  ? Expanded(child: Photos())
                  : CommonButton(
                      title: 'Download',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        controller.downloadAPK(controller.app!.value.appFile!);
                      },
                      width: ScreenSize.w * 0.22,
                    ),
            ],
          ),
        ),
        ScreenSize.w >= 1280
            ? Container()
            : Container(
                color: const Color.fromARGB(255, 250, 250, 249),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.w * 0.1, vertical: 20),
                //height: ScreenSize.w >= 1280 ? ScreenSize.h * 0.65 : ScreenSize.h * 0.8,
                child: Photos()),
      ],
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
                    controller.app!.value.logo ?? '',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ),
            20.pw,
            Container(
                width: ScreenSize.w >= 1280
                    ? ScreenSize.w * 0.18
                    : ScreenSize.w >= 950
                        ? ScreenSize.w * 0.37
                        : ScreenSize.w * 0.4,
                child: Text(
                  controller.app!.value.appName ?? 'N/A',
                  style: CTS.h2(24),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
        20.ph,
        Container(
          width: ScreenSize.w >= 1280
              ? ScreenSize.w * 0.25
              : ScreenSize.w >= 950
                  ? ScreenSize.w * 0.5
                  : ScreenSize.w,
          child: Text(
            controller.app!.value.shortDescription ?? 'N/A',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CTS.h2(20),
          ),
        ),
        20.ph,
        Container(
          width: ScreenSize.w >= 1280
                    ? ScreenSize.w * 0.2
                    : ScreenSize.w >= 950
                        ? ScreenSize.w * 0.37
                        : ScreenSize.w ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Rating', style: CTS.h3(15)),
                  Row(
                    children: [
                      Text(
                        controller.app!.value.rating.toString(),
                        style: CTS.h2(16),
                      ),
                      2.pw,
                      Icon(Icons.star),
                    ],
                  ),
                ],
              ),
              15.pw,
              Container(
                height: 60,
                child: const VerticalDivider(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              15.pw,
              Column(
                children: [
                  Text(
                    'Downloads',
                    style: CTS.h3(15),
                  ),
                  Text(
                    controller.app!.value.totalDownloads.toString(),
                    style: CTS.h2(16),
                  ),
                ],
              ),
              15.pw,
              Container(
                height: 60,
                child: const VerticalDivider(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              15.pw,
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'Developer',
                      style: CTS.h3(15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controller.app!.value.developerName ?? 'N/A',
                      style: CTS.h2(16),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.ph,
        ScreenSize.w >= 1280
            ? CommonButton(
                title: 'Download',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  controller.downloadAPK(controller.app!.value.appFile!);
                },
                width: ScreenSize.w * 0.22,
              )
            : Container(),
      ],
    );
  }

  Widget Photos() {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: min(4, controller.app!.value.photos!.length),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                imageUrl: controller.app!.value.photos![index],
                                placeholder: (context, url) => Center(
                                    child: SpinKitPulse(
                                        size: 10,
                                        color:
                                            Colors.black54)), // Loading spinner
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error), // Error icon
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: controller.app!.value.photos![index],
                  placeholder: (context, url) => Center(
                      child: SpinKitPulse(
                          size: 10, color: Colors.black54)), // Loading spinner
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error), // Error icon
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
