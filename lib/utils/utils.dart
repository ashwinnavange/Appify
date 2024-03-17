import 'package:appify/utils/helper.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getUserId() {
    String userId = PrefHelper().getString(PrefHelper.USER_ID);
    return userId;
  }

  static void showToaster(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

extension MySizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
