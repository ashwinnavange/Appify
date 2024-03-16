import 'package:flutter/cupertino.dart';

class ScreenSize{
  static late double w;
  static late double h;

  void init(BuildContext context){
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
  }
}