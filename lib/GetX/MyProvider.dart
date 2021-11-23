import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:shoping/Model/Board.dart';
import 'package:shoping/Model/Categories.dart';
import 'package:shoping/Model/ChangeFavourite.dart';
import 'package:shoping/Model/FavouriteModel.dart';
import 'package:shoping/Model/UserData.dart';
import 'package:shoping/Model/UserModel.dart';
import 'package:shoping/Server/Dio.dart';
import 'package:shoping/Server/SharedPref.dart';
import 'package:shoping/Taps/Notifications.dart';
import 'package:shoping/Taps/Home.dart';
import 'package:shoping/Taps/Category.dart';
import 'package:shoping/Taps/Settings.dart';
import 'package:shoping/UI/LoginScreen.dart';
import 'package:shoping/UI/MainPage.dart';

class MyProvider extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  var boardController = PageController();

  @override
  void onInit() {
    print(token);
    getHomeData();
    getCategories();
    getFavourites();
    getSettings();
    getNotifications();
    getProfile();
  }

  List<Widget> widgetOptions = <Widget>[
    Home(),
    Profile(),
    Favourite(),
    Settings(),
  ];
  int selectedIndex = 0;

  setSelected(int index) {
    this.selectedIndex = index;
    update();
  }

  bool isLast = false;

  changeLast(int index) {
    if (index == boards.length - 1) {
      this.isLast = true;
    } else {
      this.isLast = false;
    }
  }

  bool read = false;

  unRead() {
    this.read = !this.read;
    update();
  }

  nextPage() {
    boardController.nextPage(
        duration: Duration(microseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  List<BoardModel> boards = [
    BoardModel(
        image: 'assets/images/bone.png',
        title: 'Discovery the favourite shop.',
        body:
            'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum N dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    BoardModel(
        image: 'assets/images/btwo.png',
        title: 'Pick up the favourite things. ',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum N dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    BoardModel(
        image: 'assets/images/bthree.png',
        title: 'Safe payment method',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum N dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
  ];

  /////////////LOGIN/////////////
  String token;

  userLogin() {
    Dio_Helper.postData(
        url: 'login',
        data: {'email': email.text, 'password': password.text},
        query: {}).then((value) {
      UserEnter userEnter = UserEnter.fromJson(value.data);
      if (userEnter.status) {
        Helper.x.SaveUsername(userEnter.status);
        token = Helper.x.SaveToken(userEnter.data.token);
        Fluttertoast.showToast(
            msg: userEnter.message,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.green,
            textColor: Colors.grey,
            fontSize: 16);
        Get.offAll(MainPage());
      } else
        Fluttertoast.showToast(
            msg: userEnter.message,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.green,
            textColor: Colors.grey,
            fontSize: 16);
      update();
    });
  }

//////////////////////////////////////////////////////////////////////

////////////Register/////////////
  userRegister() {
    Dio_Helper.postData(url: 'register', data: {
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'phone': phone.text
    }, query: {}).then((value) {
      if (value.data['status'] == true) {
        Get.offAll(LoginScreen());
      } else
        print(value.data);
      update();
    });
  }

  userLogout(String token) {
    Dio_Helper.postData(url: 'logout', data: {'fcm_token': token}, query: {})
        .then((value) => null);
  }

//////////////////////////////////////////////////////////////////////

////////////GetHomeData////////////
//   HomeModel homeModel;
  List<dynamic> banners;
  List<dynamic> products;
  Map<int, bool> favouries = {};

  getHomeData() {
    Dio_Helper.getData(url: 'home', token: token).then((value) {
      //homeModel = HomeModel.fromJson(value.data);
      banners = value.data['data']['banners'];
      products = value.data['data']['products'];
      value.data['data']['products'].forEach((element) {
        favouries.addAll({element['id']: element['in_favorites']});
      });
    });
  }

//////////////////////////////////////////////////////////////////////

  //////////////////////Change Favourite////////////////////
  ChangeFavourite changeFavourite;

  changeFavourites(int id) {
    favouries[id] = !favouries[id];
    update();
    Dio_Helper.postData(
            url: 'favorites', data: {'product_id': id}, token: token)
        .then((value) => (value) {
              changeFavourite = ChangeFavourite.fromJson(value.data);
              if (!changeFavourite.status) {
                favouries[id] = !favouries[id];
              } else {
                getFavourites();
              }
            });
  }

  //////////////////////////////////////////////////////////////////////////////////////

  ////////////////////Get All Categories////////////////////////////////////
  Categories categories;

  getCategories() {
    Dio_Helper.getData(url: 'categories')
        .then((value) => categories = Categories.fromJson(value.data));
  }

  //////////////////////////////////////////////////////////////////////
  Categories details;
getDetailsCategory(int id){
    Dio_Helper.getData(url: 'categories/'+id.toString()).then((value){
      details = Categories.fromJson(value.data);
    });
}
  ////////////////////Get All Favourites////////////////////////////////////
  FavouritesModel favouritesModel;
  List<Map<String,dynamic>> favourotesL;

  getFavourites() {
    Dio_Helper.getData(url: 'favorites', token: token,).then(
        (value){
          favouritesModel = FavouritesModel.fromJson(value.data);

        }
    );
  }

  //////////////////////////////////////////////////////////////////////
Map<dynamic,dynamic> settings;
  getSettings(){
  Dio_Helper.getData(url: 'settings',).then((value){
    settings= value.data['data'];
  });
}
////////////////////////////////////////////////////////////////////////////
List<dynamic> notifications;

getNotifications(){
  Dio_Helper.getData(url: 'notifications',token: token).then((value){
    notifications= value.data['data']['data'];
  });
}
ShoppingModel shoppingModel;
getProfile(){
  Dio_Helper.getData(url: 'profile').then((value){
    shoppingModel = ShoppingModel.fromJson(value.data);
  });
}

  /////////////////////////////////////////////////////////
////important (print full text)///////
  printFull(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((element) {
      print(element.group(0));
    });
  }
}
