import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../reusables/custom_text_button.dart';
import '../../../utils/screen_size.dart';
import '../controller/upload_controller.dart';

class UploadSection extends GetWidget<UploadController> {
  const UploadSection({super.key});

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

  Widget UploadBodySection(BuildContext context) {
    return Column(
      children: [
        UploadLogoAndTitle(),
        20.ph,
        UploadFiles(ScreenSize.w, ScreenSize.h * 0.1, "Upload App Screenshots"),
        20.ph,
        UploadFiles(ScreenSize.w, ScreenSize.h * 0.1, "Upload .apk file"),
        20.ph,
        CustomTextField("Description", controller.descriptionController,
            ScreenSize.w, true, 10),
        20.ph,
        CustomTextField(
            "What's New", controller.whatsNewController, ScreenSize.w, true, 5),
        20.ph,
        CustomTextField("Category (List Max 3 Seperated by comma)",
            controller.categoryController, ScreenSize.w, false, 1),
        20.ph,
        UploadAndCancelButtons(),
      ],
    );
  }

  Widget UploadLogoAndTitle() {
    return ScreenSize.w >= 950
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UploadFiles(
                  ScreenSize.w * 0.2, ScreenSize.w * 0.1, "Upload Logo"),
              20.pw,
              Expanded(
                child: Column(
                  children: [
                    CustomTextField("App Title", controller.titleController,
                        ScreenSize.w * 0.55, false, 1),
                    20.ph,
                    CustomTextField(
                        "Short Description",
                        controller.shortDescriptionController,
                        ScreenSize.w * 0.55,
                        false,
                        1),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              UploadFiles(ScreenSize.w, ScreenSize.w * 0.2, "Upload Logo"),
              20.ph,
              CustomTextField("App Title", controller.titleController,
                  ScreenSize.w, false, 1),
              20.ph,
              CustomTextField(
                  "Short Description",
                  controller.shortDescriptionController,
                  ScreenSize.w,
                  false,
                  1),
            ],
          );
  }

  Widget CustomTextField(String hintText, TextEditingController controller,
      double width, bool isMultiline, int maxlines) {
    return Container(
      width: width,
      child: TextField(
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
      ),
    );
  }

  Widget UploadFiles(double width, double height, String title) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.upload_outlined,
            color: Colors.grey,
            size: 30,
          ),
          5.pw,
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget UploadAndCancelButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CommonButton(
          onPressed: () {},
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
