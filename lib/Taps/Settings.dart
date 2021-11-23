import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoping/Components/MyCard.dart';
import 'package:shoping/Components/profileWidget.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/GetX/getStorage.dart';
import 'package:get/get.dart';
import 'package:shoping/Server/SharedPref.dart';
import 'package:shoping/UI/FirstScreen.dart';

class Settings extends StatelessWidget {
  Settings();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
        init: MyProvider(),
        builder: (getx) => getx.settings == null
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 85,
                      backgroundImage: NetworkImage(
                     'https://images.freeimages.com/images/small-previews/f37/cloudy-scotland-1392088.jpg'),
                    ),
                    ItemWidget(
                      label: 'Email:',
                      value: getx.shoppingModel.data.email??'',
                      size: 14,
                    ),
                    ItemWidget(
                        label: 'Name:',
                        value: getx.shoppingModel.data.name??''),
                    ItemWidget(
                        label: 'Phone:',
                        value: getx.shoppingModel.data.phone??''),
                    Text(
                      'About',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        getx.settings['about'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 10.5),
                      ),
                    ),
                    Text(
                      'Terms',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        getx.settings['terms'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 10.5),
                      ),
                    ),
                    MyCard(
                      name: 'Change Dark Mode',
                      subname: 'You can switch to dark mode or verse versa',
                      iconData: LineIcons.moon,
                      function: () {
                        ThemeStorage().changeThemeMode();
                      },
                    ),
                    MyCard(
                      name: 'Change Language',
                      subname:
                          'You can switch to english language or verse versa',
                      iconData: Icons.language,
                      function: () {
                        ThemeStorage().changeLanguage();
                      },
                    ),
                    MyCard(
                      name: 'LogOut',
                      subname: 'You can Logout to re enter the app',
                      iconData: Icons.login_outlined,
                      function: () {
                        Helper.x.sharedPreferences
                            .clear()
                            .then((value) => Get.offAll(FirstScreen()));
                      },
                    ),
                  ],
                ),
              ));
  }
}
