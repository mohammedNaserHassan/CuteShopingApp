import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/Components/buildCategory.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/UI/CatrgoryDetails.dart';

class Profile extends StatelessWidget {
  Profile();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (getx) => getx.categories.data.data == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: getx.categories.data.data.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    buildCategory(
                      name: getx.categories.data.data[index].name,
                      image: getx.categories.data.data[index].image,
                      function: (){
                        getx.getDetailsCategory(getx.categories.data.data[index].id);
                        Get.to(CategoryDetails());
                      },
                    ),
                    Divider(
                      height: 2,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
