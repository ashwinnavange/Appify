import 'package:appify/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class UploadController extends GetxController{

  final DashBoardController _dashBoardController = Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController whatsNewController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _dashBoardController.isLoggedin();
  }
}