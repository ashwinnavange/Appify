import 'package:appify/utils/helper.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Utils {

  static String getToken() {
    String token = PrefHelper().getString(PrefHelper.TOKEN);
    return token;
  }

  static String getUserId() {
    String token = PrefHelper().getString(PrefHelper.TOKEN);
    print(JWT.decode(token).payload['_id']);
    if(token.isNotEmpty){
      String userId = JWT.decode(token).payload['_id'];
      return userId;
    }
    return '';
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
  static Widget getLoader({Color color = const Color.fromARGB(255, 115, 19, 132)}) {
    return Center(
        child: SpinKitPulse(
            color: color,));
  }
}

extension MySizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
