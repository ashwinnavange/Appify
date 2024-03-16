import 'package:appify/presentation/dashboard/widget/all_games.dart';
import 'package:appify/reusables/myappbar.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_size.dart';
import 'controller/dashboard_controller.dart';
import 'widget/all_apps.dart';
import 'widget/image_section.dart';

class DashBoardView extends GetWidget<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageSection(),
              //TopCharts(),
              const AllApps(),
              20.ph,
              const AllGames(),
            ],
          ),
        ),);
  }

  // ignore: non_constant_identifier_names
  Widget HeaderButtons() {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenSize.w * 0.05,
        right: ScreenSize.w * 0.05,
        top: ScreenSize.h * 0.04,
      ),
      width: ScreenSize.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
            },
            child: Row(
              children: [
                const Icon(Icons.home_outlined),
                5.pw,
                const Text('Home',style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: Row(
              children: [
                const Icon(Icons.apps_outlined),
                5.pw,
                const Text('Apps',style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: Row(
              children: [
                const Icon(Icons.sports_esports_outlined),
                5.pw,
                const Text('Games',style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
