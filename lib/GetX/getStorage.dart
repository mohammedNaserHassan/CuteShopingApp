import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping/Components/Themes.dart';

class ThemeStorage {
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
////////////////////////////////////////////////////////////////////////////////////////////////////////
  final languageKey = 'languageKey';

  String getLanguage() {
    return isSavedLanguage() ? Themees.lang='en' : Themees.lang='en';
  }

  bool isSavedLanguage() {
    return GetStorage().read(languageKey) ?? false;
  }

  void saveLanguage(bool isLan) {
    GetStorage().write(languageKey, isLan);
  }

  void changeLanguage() {
    saveLanguage(!isSavedLanguage());
  }
}
