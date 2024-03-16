import 'package:appify/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/helper.dart';
import 'utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return GetMaterialApp(
      title: 'Appify',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.page,
      initialRoute: AppRoutes.dashboard,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
    );
  }
}


