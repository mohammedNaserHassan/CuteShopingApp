import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themees {
  static String lang='ar';
  static final arabic="ar";
  static final english="en";
  static final lightTheme = ThemeData(
    backgroundColor: Colors.deepPurple,
    fontFamily: 'Janna',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white10,
        elevation: 0
      ),
      canvasColor: Colors.white,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey)
      ,  bodyText2: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black)
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
          elevation: 0));

  static final darkTheme = ThemeData(
      backgroundColor: Colors.deepOrange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        elevation: 0
      ),
      fontFamily: 'Janna',
      canvasColor: Colors.black,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey),
          bodyText2: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white)
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff333739),
              statusBarIconBrightness: Brightness.light),
          backgroundColor: Colors.black,
          elevation: 0));
}
