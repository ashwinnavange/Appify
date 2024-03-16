import 'package:appify/presentation/upload/bindings/upload_binding.dart';
import 'package:appify/presentation/upload/upload_view.dart';
import 'package:get/get.dart';
import '../presentation/dashboard/binding/dashboard_binding.dart';
import '../presentation/dashboard/dashboard_view.dart';
import '../presentation/details/binding/details_binding.dart';
import '../presentation/details/details_view.dart';

class AppRoutes{

  static const String dashboard= '/';

  static const String details= '/details';

  static const String upload= '/upload';

  static List<GetPage> page = [
    GetPage(
      name: dashboard,
      page: () => const DashBoardView(),
      bindings: [
        DashBoardBinding(),
      ]
    ),
    GetPage(
      name: details,
      page: () => const DetailsView(),
      bindings: [
        DetailsBinding(),
      ]
    ),
    GetPage(
      name: upload,
      page: () => const UploadView(),
      bindings: [
        UploadBinding(),
      ]
    ),
  ];
}