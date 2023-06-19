import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeData> currentTheme = ThemeData.light().obs;

  void changeTheme() {
    currentTheme.value = Get.isDarkMode ? ThemeData.light() : ThemeData.dark();
  }

  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData getTheme() {
    return isDarkMode.value ? ThemeData.dark() : ThemeData.light();
  }
}

// class ThemeController extends GetxController {
//   RxBool isDarkMode = false.obs;

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
//   }
// }
