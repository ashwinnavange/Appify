import 'package:appify/reusables/myappbar.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reusables/footer.dart';
import 'controller/details_controller.dart';
import 'widget/description_section.dart';
import 'widget/header_section.dart';

class DetailsView extends GetWidget<DetailsController> {
  DetailsView({super.key});

  String packageName = Get.parameters['id'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Obx(()=> controller.isLoading.value ?  Utils.getLoader() : packageName == '' ?  Center(child: Text("No data found")) :
      SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),
            const DescriptionSection(),
            //const RatingSection(),
            30.ph,
            const FooterView(),
          ],
        ),
      ),),
    );
  }
}
