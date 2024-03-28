import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../reusables/myappbar.dart';
import '../../reusables/unauthorized_view.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'controller/upload_controller.dart';
import 'widget/upload_section.dart';

class UploadView extends GetWidget<UploadController> {
  UploadView({super.key});

  final DashBoardController _dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.grey.withOpacity(0.5),
          overlayWidgetBuilder: (_) {
          return const Center(
            child: SpinKitPulse(
              color: Colors.deepPurple,
              size: 50.0,
            ),
          );
        },
          child: SingleChildScrollView(
            child: Obx(() => _dashBoardController.isLoggedin.isTrue || controller.isLoading.value
                ? UploadSection()
                : const UnAuthorizedView()),
          ),
        ),
      ),
    );
  }
}
