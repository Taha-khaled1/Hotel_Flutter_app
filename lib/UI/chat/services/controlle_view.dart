import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/Bottom_Nav_Bar/bottomNavBar.dart';
import 'package:hotelbooking/UI/IntroApps/Login.dart';

import 'auth_controller.dart';

class ControleView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthViewModel());
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? Login()
          : BottomNavBar();
    });
  }
}
