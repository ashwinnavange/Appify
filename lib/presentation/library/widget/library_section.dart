import 'package:appify/reusables/custom_text_button.dart';
import 'package:appify/utils/routes.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/screen_size.dart';
import '../../../utils/theme.dart';
import '../controller/library_controller.dart';

class LibrarySection extends GetWidget<LibraryController> {
  const LibrarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.w * 0.05,
          vertical: ScreenSize.h * 0.05,
        ),
        width: ScreenSize.w,
        child: LibraryBodySection(context),
      ),
      desktop: (BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.w * 0.1,
          vertical: ScreenSize.h * 0.05,
        ),
        child: LibraryBodySection(context),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LibraryBodySection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Library',
          style: CTS.h1(24),
        ),
        10.ph,
        Obx(()=> controller.library == null ? Expanded(
              child: Center(
                  child: Text(
                    'Something went wrong. Please try again later.',
                    style: CTS.h1(16),
                  ),
                ),
            ) :
        controller.library!.isEmpty
            ? Expanded(
              child: Center(
                  child: Text(
                    'No Apps Found',
                    style: CTS.h1(16),
                  ),
                ),
            )
            :
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => LibraryCard(context, index),
            itemCount: controller.library!.length,
            shrinkWrap: true,
          ),
        ),),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget LibraryCard(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                controller.library![index].logo!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.library![index].appName!,
                      style: CTS.h1(16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      controller.library![index].shortDescription!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CTS.h2(14),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          'Package Name: ',
                          style: CTS.h2(14),
                        ),
                        Text(
                          controller.library![index].packageName!,
                          style: CTS.h3(14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ' | Version: ',
                          style: CTS.h2(14),
                        ),
                        Text(
                          controller.library![index].version!,
                          style: CTS.h3(14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ' | Downloads: ',
                          style: CTS.h2(14),
                        ),
                        Text(
                          controller.library![index].totalDownloads.toString(),
                          style: CTS.h3(14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButton(
                    onPressed: () {},
                    title: 'Update',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    width: width / 5,
                  ),
                  CommonButton(
                    onPressed: () {
                      controller.showMyDialog(context, controller.library![index].appName!, controller.library![index].packageName!);
                    },
                    title: 'Delete',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    width: width / 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
