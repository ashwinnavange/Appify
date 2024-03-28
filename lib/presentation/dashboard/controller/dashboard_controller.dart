import 'dart:async';

import 'package:appify/presentation/dashboard/service/dashboard_service.dart';
import 'package:appify/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/app_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/helper.dart';

class DashBoardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoginLoading = false.obs;
  RxBool isLoggedin = false.obs;
  Rx<User>? user;
  RxList<App>? apps = <App>[].obs;
  RxList<App>? games = <App>[].obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final DashBoardSerivce _dashboardService = DashBoardSerivce();

  final RxList<String> _words = ["Do more", "Work smarter", "Rest Easier","Go bigger"].obs;
  final RxInt _currentIndex = 0.obs;
  final RxString _currentWord = "".obs;

  Stream<String> get textStream => _currentWord.stream;

  void _startAnimation() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _currentWord.value = _words[_currentIndex.value];
      _currentIndex.value = (_currentIndex.value + 1) % _words.length;
    });
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    await isLoggedIn();
    _startAnimation();
    await getAllApps();
    await getAllGames();
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

  void toggleLoginLoading(bool value) {
    isLoginLoading.value = value;
  }

  Future<void> isLoggedIn() async {
    if (Utils.getToken() == '') {
      isLoggedin(false);
    } else {
      await getUser();
    }
  }

  Future<void> showMyDialog(BuildContext context, bool isSignUp) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: !isSignUp ? const Text('Log in') : const Text('Sign Up'),
              content: SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.down,
                child: Builder(
                  builder: (context) {
                    double height = MediaQuery.of(context).size.height;
                    double width = MediaQuery.of(context).size.width;
                    return Form(
                      key: formKey,
                      child: SizedBox(
                        height: isSignUp ? height * 0.4 : height * 0.2,
                        width: width * 0.4,
                        child: isSignUp ? _showSignUpDialog() : _showLoginDialog(),
                      ),
                    );
                  },
                ),
              ),
              actions: <Widget>[
               TextButton(
                    onPressed: () async {
                            if (formKey.currentState!.validate()) isSignUp ? await registerUser() : await loginUser();
                          },
                    child:
                        isSignUp ? const Text('Sign Up') : const Text('Login'),
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
        CustomTextFieldInput(nameController, 'Name'),
        CustomTextFieldInput(emailController, 'Email'),
        CustomTextFieldInput(passwordController, 'Password'),
        CustomTextFieldInput(confirmPasswordController, 'Confirm Password'),
      ],
    );
  }

  Widget _showLoginDialog() {
    return Column(
      children: <Widget>[
        CustomTextFieldInput(emailController, 'Email'),
        CustomTextFieldInput(passwordController, 'Password'),
      ],
    );
  }

  Widget CustomTextFieldInput(TextEditingController controller, String label){
    return TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            obscureText: label == 'Password' || label == 'Confirm Password' ? true : false,
            validator: (val) {
            if (val == null || val.trim() == '') {
              return 'Please Enter $label';
            } 
            if(label == 'Email' && !RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$').hasMatch(val)){
              return 'Please Enter a valid Email';
            }
            if(label == 'Password' && val.length < 6){
              return 'Password should be atleast 6 characters';
            }
            if(label == 'Confirm Password' && val != passwordController.text){
              return 'Password and Confirm Password should be same';
            }
            else {
              return null;
            }
          }
          );
  }

  Future<void> getUser() async {
    toggleLoading(true);
    try {
      final response = await _dashboardService.getUser(Utils.getUserId());
      if(response.message=='Unauthorized' || response.message=='Invalid Token'){
        isLoggedin(false);
        return;
      }
      if (response.status) {
        isLoggedin(true);
        user = Rx(User(email: '', id: '', name: ''));
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
    toggleLoginLoading(true);
    try {
      final response = await _dashboardService.registerUser(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim());
      if (response.status) {
        await PrefHelper().setString(PrefHelper.TOKEN, response.data['token']);
        await PrefHelper()
            .setString(PrefHelper.USER_NAME, response.data['name']);
        isLoggedin(true);
        Navigator.of(Get.context!).pop();
        Utils.showToaster(response.message, Get.context!);
      } else {
        Utils.showToaster(response.message, Get.context!);
      }
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoginLoading(false);
    }
  }

  Future<void> loginUser() async {
    toggleLoginLoading(true);
    try {
      final response = await _dashboardService.loginUser(
          emailController.text.trim(), passwordController.text.trim());
      if (response.status) {
        await PrefHelper().setString(PrefHelper.TOKEN, response.data['token']);
        await PrefHelper()
            .setString(PrefHelper.USER_NAME, response.data['name']);
        isLoggedin(true);
        Navigator.of(Get.context!).pop();
        Utils.showToaster(response.message, Get.context!);
      } else {
        Utils.showToaster(response.message, Get.context!);
      }
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoginLoading(false);
    }
  }

  Future<void> getAllApps() async {
    toggleLoading(true);
    try {
      final response = await _dashboardService.getAllApps();
      if (response.status) {
        apps = <App>[].obs;
        apps!.value = (response.data as AppList).apps!;
        return;
      }
      Utils.showToaster(response.message, Get.context!);
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoading(false);
    }
  }

  Future<void> getAllGames() async {
    toggleLoading(true);
    try {
      final response = await _dashboardService.getAllGames();
      if (response.status) {
        games = <App>[].obs;
        games!.value = (response.data as AppList).apps!;
        return;
      }
      Utils.showToaster(response.message, Get.context!);
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toggleLoading(false);
    }
  }
}
