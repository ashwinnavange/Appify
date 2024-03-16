import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderUploadSection extends StatelessWidget {
  const HeaderUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileUploadHeaderSection(context),
      desktop: (BuildContext context) => DesktopUploadHeaderSection(context),
    );
  }
  Widget MobileUploadHeaderSection(context){
    return Container();
  }

  Widget DesktopUploadHeaderSection(context){
    return Container();
  }
}