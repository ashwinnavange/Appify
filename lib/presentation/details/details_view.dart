import 'package:appify/reusables/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/details_controller.dart';
import 'widget/description_section.dart';
import 'widget/header_section.dart';
import 'widget/ratings_section.dart';

class DetailsView extends GetWidget<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),
            const DescriptionSection(),
            //const RatingSection(),
          ],
        ),
      ),
    );
  }
}
