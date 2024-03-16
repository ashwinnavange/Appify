import 'package:appify/utils/routes.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/screen_size.dart';

class AllApps extends StatefulWidget {
  const AllApps({super.key});

  @override
  State<AllApps> createState() => _AllAppsState();
}

class _AllAppsState extends State<AllApps> {
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
  Widget HorizontalScroll() {
    return SizedBox(
      height: ScreenSize.h * 0.32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.details);
            },
            child: AppCard(context, index),
          );
        },
      ),
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
                child: Image.network(
                  'https://play-lh.googleusercontent.com/ZI21NMObsjB7DbPU_EXRymHJL3HQpfsrB2N4CWb-diXm4xjl_13mmetYQZvcpgGf-64=s256-rw',
                  width: ScreenSize.h * 0.19,
                  height: ScreenSize.h * 0.19,
                ),
              ),
              20.ph,
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'App $index ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const Row(
                    children: [
                      Icon(Icons.star),
                      Text('4.5'),
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
