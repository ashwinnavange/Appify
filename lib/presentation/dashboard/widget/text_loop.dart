import 'dart:async';
import 'package:appify/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:appify/utils/theme.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../reusables/custom_text_button.dart';
import '../../../utils/screen_size.dart';


class AnimatedTextWidget extends GetWidget<DashBoardController> {

  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<String>(
          stream: controller.textStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenSize.h * 0.07,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              );
            } else {
              return Container(
                child: Text(
                  "Do more",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize.h * 0.07,
                      fontWeight: FontWeight.bold,
                      height: 1.1),
                ),
              );
            }
          },
        ),
        Text(
          "with apps",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenSize.h * 0.07,
              fontWeight: FontWeight.bold,
              height: 1.1),
        ),
        20.ph,
        Obx(()=>
        controller.isLoggedin.value ? Text("Welcome back, ${Utils.getUserName()}!",style: CustomTextStyle.heading1(color: Colors.white),) : 
        ScreenSize.w > 950 ? 
        Row(children: [
          CommonButton(
            backgroundColor: Colors.white,
            onPressed: (){
              controller.showMyDialog(context,false);
            },
            textColor: Colors.black,
            title: "Log in",
            width: ScreenSize.w * 0.06,
          ),
          20.pw,
          CommonButton(
            backgroundColor: const Color.fromARGB(255, 74,222,128),
            onPressed: (){
              controller.showMyDialog(context,true);
            },
            textColor: Colors.black,
            title: "Sign up for Appify",
            width: ScreenSize.w * 0.12,
          ),
        ],) : Column(
          children: [
            CommonButton(
              backgroundColor: Colors.white,
              onPressed: (){
                controller.showMyDialog(context,false);
              },
              textColor: Colors.black,
              title: "Log in",
              width: ScreenSize.w ,
            ),
            20.ph,
            CommonButton(
              backgroundColor: const Color.fromARGB(255, 74,222,128),
              onPressed: (){
                controller.showMyDialog(context,true);
              },
              textColor: Colors.black,
              title: "Sign up for Appify",
              width: ScreenSize.w ,
            ),
          ],
        ),),
      ],
    );
  }
}
