import 'package:appify/presentation/upload/widget/header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../reusables/myappbar.dart';
import 'controller/upload_controller.dart';
import 'widget/middle_section.dart';

class UploadView extends GetWidget<UploadController> {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderUploadSection(),
            const MiddleUploadSection(),
          ],
        ),
      ),
    );
  }
}