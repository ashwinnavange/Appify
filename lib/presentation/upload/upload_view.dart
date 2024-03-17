import 'package:appify/presentation/upload/widget/upload_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reusables/myappbar.dart';
import '../../reusables/unauthorized_view.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'controller/upload_controller.dart';

class UploadView extends GetWidget<UploadController> {
  UploadView({super.key});

  final DashBoardController _dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Obx(() => _dashBoardController.isLoggedin.isTrue
            ? const UploadSection()
            : const UnAuthorizedView()),
      ),
    );
  }
}
