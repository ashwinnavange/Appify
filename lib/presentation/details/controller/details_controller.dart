import 'package:appify/presentation/details/service/details_service.dart';
import 'package:appify/utils/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/app_model.dart';
import '../../../utils/utils.dart';

class DetailsController extends GetxController{
  RxBool isLoading = false.obs;
  Rx<App>? app = App().obs;
  String? packageName;

  final DetailsService _detailsService = DetailsService();

  void toggleLoading(bool value) {
    isLoading.value = value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    packageName = Get.arguments ?? "com.test";
    if (packageName == null) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      await getAppDetails();
    }
  }

  Future<void> downloadAPK(String link) async {
    final Uri url = Uri.parse(link);
    await launchUrl(url);
  }

  Future<void> getAppDetails() async {
    toggleLoading(true);
    try {
      final response = await _detailsService.getAppDetails(packageName!);
      if (response.status) {
        app = App().obs;
        app!.value = (response.data as App);
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