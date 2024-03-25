import 'package:appify/presentation/library/controller/library_controller.dart';
import 'package:get/get.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> LibraryController());
  }
}