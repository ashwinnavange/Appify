import 'package:appify/presentation/library/binding/library_binding.dart';
import 'package:appify/presentation/library/library_view.dart';
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

  static const String library= '/library';

  static List<GetPage> page = [
    GetPage(
      name: dashboard,
      page: () => const DashBoardView(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        DashBoardBinding(),
      ]
    ),
    GetPage(
      name: details,
      page: () => DetailsView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        DetailsBinding(),
        DashBoardBinding(),
      ]
    ),
    GetPage(
      name: upload,
      page: () => UploadView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        UploadBinding(),
        DashBoardBinding(),
      ]
    ),
    GetPage(
      name: library,
      page: () => LibraryView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        LibraryBinding(),
        DashBoardBinding(),
      ]
    ),
  ];
}