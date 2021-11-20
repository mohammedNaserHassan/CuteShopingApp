import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping/Components/Themes.dart';

class ThemeStorage {
  Color bac = Colors.white;
  final storageKey = 'isDarkMode';

  ThemeData getThemeMode() {
    return isSavedDarkMode() ? Themees.darkTheme : Themees.lightTheme;
  }

  bool isSavedDarkMode() {
    return GetStorage().read(storageKey) ?? true;
  }

  void saveThemeMode(bool isDark) {
    GetStorage().write(storageKey, isDark);
  }

  void changeThemeMode() {
    Get.changeTheme(isSavedDarkMode() ? Themees.lightTheme : Themees.darkTheme);
    saveThemeMode(!isSavedDarkMode());
  }
}
