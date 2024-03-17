// ignore: must_be_immutable
import 'package:appify/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:appify/utils/helper.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/routes.dart';
import '../utils/screen_size.dart';
import 'custom_text_button.dart';

// ignore: must_be_immutable
class MyAppBar extends GetWidget<DashBoardController>
    implements PreferredSizeWidget {
  bool isSignUp = false;

  MyAppBar({super.key});

  Future<void> _showMyDialog(BuildContext context, bool isSignUp) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: !isSignUp ? Text('Log in') : Text('Sign Up'),
              content: Builder(
                builder: (context) {
                  double height = MediaQuery.of(context).size.height;
                  double width = MediaQuery.of(context).size.width;
                  return SizedBox(
                    height: isSignUp ? height * 0.3 : height * 0.2,
                    width: width * 0.4,
                    child: isSignUp ? _showSignUpDialog() : _showLoginDialog(),
                  );
                },
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    isSignUp
                        ? await controller.registerUser()
                        : await controller.loginUser();
                  },
                  child: isSignUp ? const Text('Sign Up') : const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _showSignUpDialog() {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller.nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: controller.emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: controller.passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        TextField(
          controller: controller.confirmPasswordController,
          decoration: const InputDecoration(labelText: 'Confirm Password'),
          obscureText: true,
        ),
      ],
    );
  }

  Widget _showLoginDialog() {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller.emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: controller.passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
      ],
    );
  }

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
          Utils.getUserId() == '' ? navButtons(context) : navUser(context),
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
        Get.toNamed(AppRoutes.dashboard);
      },
      child: Row(
        children: [
          Image.asset(
            'logo/logo.png',
            height: 40,
            width: 40,
          ),
          10.pw,
          const Text(
            'Appify',
            style: TextStyle(
              fontSize: 20,
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
              color: Color.fromARGB(255, 16, 134, 20),
            )
          ],
        ),
      ),
    );
  }

  Widget navUser(context) {
    return PopupMenuButton<int>(
      offset: Offset(0, 60),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Center(child: Text('Welcome, ${Utils.getUserName()}!')),
          enabled: false,
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.upload),
              SizedBox(width: 10),
              Text("Upload App"),
            ],
          ),
        ),
        PopupMenuItem(
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
        if (value == 1) {
          Get.toNamed(AppRoutes.upload);
        }
        if (value == 2) {
          PrefHelper().removeCache();
          controller.isLoggedIn();
        }
      },
      child: CircleAvatar(
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
    return Row(
      children: [
        CommonButton(
          title: 'Log in',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _showMyDialog(context, false);
          },
          width: 100,
        ),
        10.pw,
        CommonButton(
          title: 'Sign up',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            _showMyDialog(context, true);
          },
          width: 100,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
