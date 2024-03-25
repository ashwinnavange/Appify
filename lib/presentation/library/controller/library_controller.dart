import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import '../../../model/library_model.dart';
import '../../../utils/utils.dart';
import '../service/library_service.dart';

class LibraryController extends GetxController{
  RxBool isLoggedin = false.obs;
  RxBool isLoading = false.obs;
  RxList<Library> library = <Library>[].obs;

  final LibraryService _libraryService = LibraryService(); 

  void toogleLoading(bool val){
    isLoading.value = val;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getLibrary();
  }

  Future<void> showMyDialog(BuildContext context, String appName, String packageName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Builder(
                  builder: (context) {
                    double height = MediaQuery.of(context).size.height;
                    double width = MediaQuery.of(context).size.width;
                    return SizedBox(
                      height: height * 0.1,
                      width: width * 0.4,
                      child: Center(
                        child: Text(
                          'Are you sure you want to delete $appName?',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: <Widget>[
               TextButton(
                    onPressed: () async {
                            await deleteApp(packageName);
                          },
                    child:
                      const Text('Delete', style: TextStyle(color: Colors.red)),
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

  Future<void> getLibrary() async {
    toogleLoading(true);
    try {
      final response = await _libraryService.getLibrary(Utils.getUserId());
      if(response.message=='Unauthorized' || response.message=='Invalid Token'){
        isLoggedin(false);
        return;
      }
      if (response.status) {
        isLoggedin(true);
        library = <Library>[].obs;
        library.value = (response.data as LibraryList).library;
        return;
      }
      Utils.showToaster(response.message, Get.context!);
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toogleLoading(false);
    }
  }

  Future<void> deleteApp(String packageName) async {
    toogleLoading(true);
    try {
      final response = await _libraryService.deleteApp(packageName);
      if (response.status) {
        Utils.showToaster(response.message, Get.context!);
        Navigator.of(Get.context!).pop();
        html.window.location.reload();
        return;
      }
      Utils.showToaster(response.message, Get.context!);
    } catch (e) {
      Utils.showToaster("Error", Get.context!);
    } finally {
      toogleLoading(false);
    }
  }
}