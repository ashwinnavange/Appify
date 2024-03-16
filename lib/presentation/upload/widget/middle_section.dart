import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MiddleUploadSection extends StatelessWidget {
  const MiddleUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileUploadMiddleSection(context),
      desktop: (BuildContext context) => DesktopUploadMiddleSection(context),
    );
  }
  Widget MobileUploadMiddleSection(context){
    return Container();
  }

  Widget DesktopUploadMiddleSection(context){
    return Container();
  }
}