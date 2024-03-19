import 'dart:typed_data';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../reusables/custom_text_button.dart';
import '../../../utils/screen_size.dart';
import '../controller/upload_controller.dart';

// ignore: must_be_immutable
class UploadSection extends GetWidget<UploadController> {
  UploadSection({super.key});

  final formKey = GlobalKey<FormState>();
  Uint8List? apkFile = Uint8List(00);
  List<Uint8List>? screenshotFile = [];
  Uint8List? logoFile = Uint8List(0);
  String type = 'App';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.w * 0.05,
          vertical: ScreenSize.h * 0.05,
        ),
        width: ScreenSize.w,
        child: UploadBodySection(context),
      ),
      desktop: (BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.w * 0.1,
          vertical: ScreenSize.h * 0.05,
        ),
        child: UploadBodySection(context),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UploadBodySection(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          UploadLogoAndTitle(),
          20.ph,
          UploadFiles(
            ScreenSize.w,
            ScreenSize.h * 0.1,
            "Upload App Screenshots",
            () async {
              List<Uint8List>? result =
                  await controller.getMultipleFile(["jpg", "png"]);
              if (result != null) {
                screenshotFile = result;
                Utils.showToaster("Files Uploaded!", Get.context!);
              } else {
                Utils.showToaster("Upload App Screenshots", Get.context!);
              }
            },
          ),
          20.ph,
          UploadFiles(
            ScreenSize.w,
            ScreenSize.h * 0.1,
            "Upload .apk file",
            () async {
              Uint8List? result = await controller.getFile(["apk"]);
              if (result != null) {
                apkFile = result;
                Utils.showToaster("File Uploaded!", Get.context!);
              } else {
                Utils.showToaster("Upload .apk file", Get.context!);
              }
            },
          ),
          20.ph,
          CustomTextField("Short Description",
              controller.shortDescriptionController, ScreenSize.w, false, 1),
          20.ph,
          CustomTextField("Description", controller.descriptionController,
              ScreenSize.w, true, 10),
          20.ph,
          CustomTextField("What's New", controller.whatsNewController,
              ScreenSize.w, true, 5),
          20.ph,
          Container(
            width: ScreenSize.w,
            child: DropdownButton<String>(
              value: 'App',
              onChanged: (String? newValue) {
                type = newValue!;
              },
              items: <String>['App', 'Game'] // Dropdown items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),),
          ),
          20.ph,
          CustomTextField("Category (List Max 3 Seperated by comma)",
              controller.categoryController, ScreenSize.w, false, 1),
          20.ph,
          UploadAndCancelButtons(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UploadLogoAndTitle() {
    return ScreenSize.w >= 950
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UploadFiles(
                ScreenSize.w * 0.2,
                ScreenSize.h * 0.27,
                "Upload Logo",
                () async {
                  Uint8List? result = await controller.getFile(["jpg", "png"]);
                  if (result != null) {
                    logoFile = result;
                    Utils.showToaster("File Uploaded!", Get.context!);
                  } else {
                    Utils.showToaster("Upload Logo", Get.context!);
                  }
                },
              ),
              20.pw,
              Expanded(
                child: Column(
                  children: [
                    CustomTextField("App Title", controller.titleController,
                        ScreenSize.w * 0.55, false, 1),
                    20.ph,
                    CustomTextField(
                        "Package Name",
                        controller.packageNameController,
                        ScreenSize.w * 0.55,
                        false,
                        1),
                    20.ph,
                    CustomTextField("Version", controller.versionController,
                        ScreenSize.w * 0.55, false, 1),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              UploadFiles(
                ScreenSize.w,
                ScreenSize.w * 0.2,
                "Upload Logo",
                () async {
                  Uint8List? result = await controller.getFile(["jpg", "png"]);
                  if (result != null) {
                    logoFile = result;
                    Utils.showToaster("File Uploaded!", Get.context!);
                  } else {
                    Utils.showToaster("Upload Logo", Get.context!);
                  }
                },
              ),
              20.ph,
              CustomTextField("App Title", controller.titleController,
                  ScreenSize.w, false, 1),
              20.ph,
              CustomTextField("Package Name", controller.packageNameController,
                  ScreenSize.w, false, 1),
              20.ph,
              CustomTextField("Version", controller.versionController,
                  ScreenSize.w * 0.55, false, 1),
            ],
          );
  }

  // ignore: non_constant_identifier_names
  Widget CustomTextField(String hintText, TextEditingController controller,
      double width, bool isMultiline, int maxlines) {
    return SizedBox(
      width: width,
      child: TextFormField(
          keyboardType:
              isMultiline ? TextInputType.multiline : TextInputType.text,
          maxLines: maxlines,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (val) {
            if (val == null || val.trim() == '') {
              return 'Please Enter $hintText';
            } else {
              return null;
            }
          }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UploadFiles(
      double width, double height, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload_outlined,
              color: Colors.grey,
              size: 30,
            ),
            5.pw,
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UploadMultipleFiles(
      double width,
      double height,
      String title,
      List<Uint8List> file,
      bool allowMultiple,
      List<String> allowedExtensions) {
    return GestureDetector(
      onTap: () async {
        List<Uint8List>? result =
            await controller.getMultipleFile(allowedExtensions);
        if (result != null) {
          file = result;
          Utils.showToaster("Files Uploaded!", Get.context!);
        } else {
          Utils.showToaster(title, Get.context!);
        }
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload_outlined,
              color: Colors.grey,
              size: 30,
            ),
            5.pw,
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UploadAndCancelButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CommonButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await controller.uploadApp(apkFile, screenshotFile, logoFile!);
            }
          },
          title: "Upload",
          backgroundColor: Colors.black,
          textColor: Colors.white,
          width: 100,
        ),
        10.pw,
        CommonButton(
          onPressed: () {},
          title: "Cancel",
          backgroundColor: Colors.transparent,
          textColor: Colors.black,
          width: 100,
        ),
      ],
    );
  }
}
