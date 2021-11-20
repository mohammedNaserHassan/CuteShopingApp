import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'GetX/MyProvider.dart';
import 'GetX/getStorage.dart';
import 'Server/Dio.dart';
import 'Server/SharedPref.dart';
import 'UI/FirstScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Helper.x.initSharedPreference();
  Dio_Helper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.72, 834.9),
      builder: () => GetBuilder<MyProvider>(
        init: MyProvider(),
        builder: (provider) => GetMaterialApp(
            theme: ThemeStorage().getThemeMode(),
            debugShowCheckedModeBanner: false,
            home: FirstScreen()),
      ),
    );
  }
}
