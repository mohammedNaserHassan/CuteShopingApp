import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/Components/buildBoard.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/GetX/getStorage.dart';
import 'package:shoping/Server/SharedPref.dart';
import 'package:shoping/UI/LoginScreen.dart';
import 'package:shoping/UI/MainPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                child: Text('Skip',style: TextStyle(color: Theme.of(context).backgroundColor),),
                onPressed: () {
                  if (Helper.x.GetUsername()) {
                    Get.offAll(MainPage());
                  } else {
                    Get.offAll(LoginScreen());
                  }
                },
              ),
            ],
            title: Text('Shopping app'),
          ),
          body: GetBuilder<MyProvider>(
            init: MyProvider(),
            builder: (provider) => Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: provider.boardController,
                    onPageChanged: (int index) {
                      provider.changeLast(index);
                    },
                    itemBuilder: (context, index) => buildBoard(
                      image: provider.boards[index].image,
                      body: provider.boards[index].body,
                      title: provider.boards[index].title,
                    ),
                    itemCount: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    title: SmoothPageIndicator(
                      controller: provider.boardController,
                      count: provider.boards.length,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          activeDotColor: Theme.of(context).backgroundColor,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 5),
                    ),
                    trailing: FloatingActionButton(
                      backgroundColor: Theme.of(context).backgroundColor,
                      onPressed: () {
                        if (provider.isLast) {
                          if (Helper.x.GetUsername()) {
                            Get.offAll(MainPage());
                          } else {
                            Get.offAll(LoginScreen());
                          }
                        } else {
                          provider.nextPage();
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
