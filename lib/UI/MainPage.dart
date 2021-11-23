import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/GetX/getStorage.dart';
import 'package:shoping/Server/SharedPref.dart';
import 'package:shoping/UI/FirstScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainPage extends StatelessWidget {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
        init: MyProvider(),
        builder: (get) => Scaffold(
              appBar: AppBar(
                title: Text('Shopping App'),
                centerTitle: true,
              ),
              body: get.widgetOptions.elementAt(get.selectedIndex),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300],
                      hoverColor: Colors.grey[100],
                      gap: 8,
                      activeColor: Colors.black,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100],
                      color: Colors.black,
                      tabs: [
                        GButton(
                          iconColor: Theme.of(context).backgroundColor,
                          icon: LineIcons.home,
                          text: 'Home',
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        GButton(
                          iconColor: Theme.of(context).backgroundColor,
                          icon: Icons.category,
                          iconActiveColor: Colors.purple,
                          text: 'Categories',
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        GButton(
                          iconColor: Theme.of(context).backgroundColor,
                          icon: Icons.notifications,
                          text: 'Notifications',
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        GButton(
                          icon: Icons.settings,
                          iconColor: Theme.of(context).backgroundColor,
                          text: 'Settings',
                          textStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                      selectedIndex: get.selectedIndex,
                      onTabChange: (index) {
                        get.setSelected(index);
                      },
                    ),
                  ),
                ),
              ),
            ));
  }
}
