import 'package:appify/utils/theme.dart';
import 'package:flutter/material.dart';

class NoAppsAvailable extends StatelessWidget {
  const NoAppsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.transparent,
      child: Center(
        child: Text(
          "No Item Available!",
          style: CustomTextStyle.heading2(color: Colors.grey),
        ),
      ),
    );
  }
}