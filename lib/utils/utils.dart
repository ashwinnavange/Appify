import 'dart:html';

import 'package:appify/utils/helper.dart';
import 'package:appify/utils/screen_size.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getUserId() {
    String userId = PrefHelper().getString(PrefHelper.USER_ID);
    return userId;
  }

  static String getUserName() {
    String username = PrefHelper().getString(PrefHelper.USER_NAME);
    return username;
  }

  static void showToaster(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static Widget getLoader({Color color = Colors.purple}) {
    return Center(
        child: CircularProgressIndicator(
            color: color,));
  }
   static Widget getScreenLoader({Color color = Colors.purple}) {
    return Container(
      height: ScreenSize.h,
      width: ScreenSize.w,
      child: Center(
          child: CircularProgressIndicator(
              color: color,)),
    );
  }
}

extension MySizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
