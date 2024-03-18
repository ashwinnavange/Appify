import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/app_model.dart';
import '../../../utils/routes.dart';
import '../../../utils/utils.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../service/upload_service.dart';

class UploadController extends GetxController {
  final DashBoardController _dashBoardController = Get.find();
  final UploadService _uploadService = UploadService();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController whatsNewController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();

  Uint8List? apkFile;
  Uint8List? screenshotFile;
  Uint8List? logoFile;
  Rx<App>? app;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _dashBoardController.isLoggedin();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    shortDescriptionController.dispose();
    categoryController.dispose();
    whatsNewController.dispose();
    packageNameController.dispose();
    super.onClose();
  }

  void toogleLoading(bool value) {
    isLoading.value = value;
  }

  Future<Uint8List?> getFile(List<String> allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
          allowMultiple: false);
      if (result != null) {
        Uint8List file = result.files.first.bytes ?? Uint8List(0);
        return file;
      }
      return null;
    } catch (e) {
      Utils.showToaster("Error $e", Get.context!);
      return null;
    }
  }

  Future<List<Uint8List>?> getMultipleFile(
      List<String> allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
          allowMultiple: true);
      if (result != null) {
        List<Uint8List> files = result.files.map((e) => e.bytes!).toList();
        return files;
      }
      return null;
    } catch (e) {
      Utils.showToaster("Error $e", Get.context!);
      return null;
    }
  }

  Future<void> uploadApp(
    Uint8List? apkFile,
    List<Uint8List>? screenshotFile,
    Uint8List? logoFile,
  ) async {
    toogleLoading(true);
    try {
      if (apkFile!.lengthInBytes == 0 ||
          logoFile!.lengthInBytes == 0 ||
          screenshotFile!.isEmpty) {
        Utils.showToaster("Please upload required files", Get.context!);
        return;
      }
      List<String> categories = categoryController.text.split(",");
      final uploadApp = await _uploadService.postApp(
        logo: logoFile,
        appName: titleController.text.trim(),
        description: descriptionController.text.trim(),
        shortDescription: shortDescriptionController.text.trim(),
        categories: categories,
        whatsNew: whatsNewController.text.trim(),
        packageName: packageNameController.text.trim(),
        appFile: apkFile,
        developerName: Utils.getUserName(),
        type: "Free",
        userId: Utils.getUserId(),
        rating: 0,
        photos: screenshotFile,
        totalDownloads: 0,
      );
      if (uploadApp.status) {
        Utils.showToaster(uploadApp.message, Get.context!);
        Get.offAndToNamed(AppRoutes.dashboard);
      } else {
        Utils.showToaster(uploadApp.message, Get.context!);
      }
    } catch (e) {
      Utils.showToaster('Error', Get.context!);
      return;
    } finally {
      toogleLoading(false);
    }
  }
}
