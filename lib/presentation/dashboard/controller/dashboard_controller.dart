import 'package:get/get.dart';

class DashBoardController extends GetxController {
  RxInt currentIndex = 0.obs;
  
  void changeIndex() {
    currentIndex.value++;
    print(currentIndex.value);
  }
}