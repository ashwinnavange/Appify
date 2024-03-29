import 'package:appify/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:appify/utils/helper.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/routes.dart';
import '../utils/screen_size.dart';
import '../utils/theme.dart';
import 'custom_text_button.dart';

// ignore: must_be_immutable
class MyAppBar extends GetWidget<DashBoardController>
    implements PreferredSizeWidget {
  bool isSignUp = false;

  MyAppBar({super.key});

  

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(context),
      desktop: (BuildContext context) => DesktopNavBar(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.05,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          navLogo(),
          const Spacer(),
          Obx(
            () => controller.isLoggedin.isFalse
                ? navButtons(context)
                : navUser(context),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.1,
      ),
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          navLogo(),
          const Spacer(),
          Obx(
            () => controller.isLoggedin.isFalse
                ? navButtons(context)
                : navUser(context),
          )
        ],
      ),
    );
  }

  Widget navLogo() {
    return InkWell(
      onTap: () {
        Get.offAndToNamed(AppRoutes.dashboard);
      },
      child: Row(
        children: [
          Icon(Icons.redeem_sharp, size: 40, color: Colors.black),
          10.pw,
          const Text(
            'Appify',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 3,
              width: 40,
              color: const Color.fromARGB(255, 16, 134, 20),
            )
          ],
        ),
      ),
    );
  }

  Widget navUser(context) {
    return PopupMenuButton<int>(
      offset: const Offset(0, 60),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(Icons.library_books_outlined),
              SizedBox(width: 10),
              Text("Library"),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.upload_outlined),
              SizedBox(width: 10),
              Text("Upload App"),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(width: 10),
              Text("Log out"),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if(value == 0){
          Get.toNamed(AppRoutes.library);
        }
        if (value == 1) {
          Get.toNamed(AppRoutes.upload);
        }
        if (value == 2) {
          PrefHelper().removeCache();
          controller.isLoggedin(false);
          Get.offAndToNamed(AppRoutes.dashboard);
        }
      },
      child: const CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFEEEEEE),
        child: Icon(
          Icons.person,
          size: 30,
        ),
      ),
    );
  }

  Widget navButtons(BuildContext context) {
    return ScreenSize.w > 600 ? Row(
      children: [
        CommonButton(
          title: 'Log in',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            controller.showMyDialog(context, false);
          },
          width: 120,
        ),
        10.pw,
        CommonButton(
          title: 'Sign up',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            controller.showMyDialog(context, true);
          },
          width: 120,
        ),
      ],
    ) : PopupMenuButton<int>(
      offset: const Offset(0, 60),
      onSelected: (value) {
        if (value == 1) {
          controller.showMyDialog(context, false);
        }
        if (value == 2) {
          controller.showMyDialog(context, true);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: Center(child: Text('Log in', style: CTS.h1(16,color: Colors.black))),
                  ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          child: Container(
            height: 40,
            width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
          child: Center(child: Text('Sign Up', style: CTS.h1(16,color: Colors.white))),
                  ),
        ),
      ],
      child: const CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFEEEEEE),
        child: Icon(
          Icons.menu,
          size: 30,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
