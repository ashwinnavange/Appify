import 'package:appify/presentation/dashboard/service/dashboard_service.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../../../utils/helper.dart';

class DashBoardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoggedin = false.obs;
  Rx<User>? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final DashBoardSerivce _dashboardService = DashBoardSerivce();

  @override
  void onInit() {
    super.onInit();
    isLoggedIn();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleLoading(bool value) {
    isLoading.value = value;
  }

  void isLoggedIn() {
    if(Utils.getUserId()==''){
      isLoggedin(false);
    }
    else{
      isLoggedin(true);
    }
  }

  Future<void> getUser() async {
    toggleLoading(true);
    try {
      final response = await _dashboardService.getUser(Utils.getUserId());
      if (response.status) {
        user = Rx(User(email: '', id: '', name: '', password: ''));
        user!.value = response.data as User;
        return;
      }
      Utils.showToaster(response.message, Get.context!);
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoading(false);
    }
  }

  Future<void> registerUser() async {
    if (nameController.text.trim() == '' ||
        emailController.text.trim() == '' ||
        passwordController.text.trim() == '' ||
        confirmPasswordController.text.trim() == '') {
      Utils.showToaster('All fields are required', Get.context!);
      return;
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Utils.showToaster(
          'Password and Confirm Password should be same', Get.context!);
      return;
    }
    toggleLoading(true);
    try {
      final response = await _dashboardService.registerUser(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim());
      if (response.status) {
        await PrefHelper().setString(PrefHelper.USER_ID, response.data['_id']);
        await PrefHelper().setString(PrefHelper.USER_NAME, response.data['name']);
        isLoggedIn();
        Utils.showToaster(response.message, Get.context!);
        Navigator.of(Get.context!).pop();
      } else {
        Utils.showToaster(response.message, Get.context!);
      }
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoading(false);
    }
  }

  Future<void> loginUser() async {
    if (emailController.text.trim() == '' ||
        passwordController.text.trim() == '') {
      Utils.showToaster('All fields are required', Get.context!);
      return;
    }
    toggleLoading(true);
    try {
      final response = await _dashboardService.loginUser(
          emailController.text.trim(), passwordController.text.trim());
      if (response.status) {
        await PrefHelper().setString(PrefHelper.USER_ID, response.data['_id']);
        await PrefHelper().setString(PrefHelper.USER_NAME, response.data['name']);
        isLoggedIn();
        Navigator.of(Get.context!).pop();
        Utils.showToaster(response.message, Get.context!);
      } else {
        Utils.showToaster(response.message, Get.context!);
      }
    } catch (e) {
      print(e);
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoading(false);
    }
  }
}
