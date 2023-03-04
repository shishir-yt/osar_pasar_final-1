import 'dart:async';

import 'package:get/get.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/home.dart';
import 'core_controller.dart';

class SplashController extends GetxController {
  final c = Get.find<CoreController>();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggedIn()) {
        Get.offAndToNamed(HomePage.routeName);
      } else {
        Get.offAndToNamed(Login.routeName);
      }
    });
  }
}
