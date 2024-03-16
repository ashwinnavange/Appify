import 'package:appify/presentation/upload/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> UploadController());
  }
}