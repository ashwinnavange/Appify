import 'package:appify/reusables/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../reusables/unauthorized_view.dart';
import '../../utils/utils.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'controller/library_controller.dart';
import 'widget/library_section.dart';

class LibraryView extends GetWidget<LibraryController> {
  LibraryView({super.key});

  final DashBoardController _dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        body: Obx(() =>
            controller.isLoading.value ? Utils.getLoader() : _dashBoardController.isLoggedin.isTrue && controller.isLoggedin.isTrue
                ? const LibrarySection()
                : const UnAuthorizedView()),
      ),
    );
  }
}
