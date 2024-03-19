import 'package:appify/utils/screen_size.dart';
import 'package:appify/utils/theme.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.w,
      height: ScreenSize.h * 0.35,
      color: Colors.black,
      padding:
          ScreenSize.w >= 950 ? EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.1, vertical: 50) :
          EdgeInsets.symmetric(horizontal: ScreenSize.w * 0.05, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Appify",
                  style: CustomTextStyle.heading1(color: Colors.white),
                ),
                Text(
                  "A platform to showcase your apps to the world.",
                  style: CustomTextStyle.heading1(color: Colors.white),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          10.pw,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "By",
                  style: CustomTextStyle.heading1(color: Colors.white),
                ),
                Text(
                  "Ashwin Navange",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.heading1(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
