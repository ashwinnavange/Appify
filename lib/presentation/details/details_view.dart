import 'package:appify/reusables/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/details_controller.dart';
import 'widget/description_section.dart';
import 'widget/header_section.dart';

class DetailsView extends GetWidget<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            DescriptionSection(),
            //const RatingSection(),
          ],
        ),
      ),
    );
  }
}
