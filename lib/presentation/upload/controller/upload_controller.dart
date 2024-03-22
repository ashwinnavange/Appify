import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/app_model.dart';
import '../../../utils/routes.dart';
import '../../../utils/utils.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../service/upload_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

class UploadController extends GetxController {
  final DashBoardController _dashBoardController = Get.find();
  final UploadService _uploadService = UploadService();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController whatsNewController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();
  TextEditingController versionController = TextEditingController();

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
    versionController.dispose();
    super.onClose();
  }

  void toogleLoading(bool value) {
    isLoading.value = value;
    if(isLoading.value) {
      Get.context!.loaderOverlay.show();
    } else {
      Get.context!.loaderOverlay.hide();
    }
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
    String type,
  ) async {
    toogleLoading(true);
    try {
      if (apkFile!.lengthInBytes == 0 ||
          logoFile!.lengthInBytes == 0 ||
          screenshotFile!.isEmpty) {
        Utils.showToaster("Please upload required files", Get.context!);
        return;
      }
      final uploadApp = await _uploadService.postApp(
        logo: logoFile,
        appName: titleController.text.trim(),
        description: descriptionController.text.trim(),
        shortDescription: shortDescriptionController.text.trim(),
        categories: categoryController.text.trim(),
        whatsNew: whatsNewController.text.trim(),
        packageName: packageNameController.text.trim(),
        appFile: apkFile,
        developerName: Utils.getUserName(),
        type: type,
        userId: Utils.getUserId(),
        rating: 0,
        photos: screenshotFile,
        totalDownloads: 0,
        version: versionController.text.trim(),
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
