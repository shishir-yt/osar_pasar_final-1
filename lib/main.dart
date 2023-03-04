import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/screens/splash_screen.dart';
import 'package:osar_pasar/utils/pages.dart';
import 'package:osar_pasar/utils/theme.dart';

import 'controller/core_controller.dart';
import 'controller/home_controller.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoreController>(
      init: Get.put(CoreController()),
      builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: basicTheme(),
          initialRoute: SplashScreen.routeName,
          initialBinding: BindingsBuilder(() {
            Get.put(CoreController());
          }),
          getPages: [...commonPages, ...userPages],
        );
      },
    );
  }
}
