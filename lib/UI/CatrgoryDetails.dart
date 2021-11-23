import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/GetX/MyProvider.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details'),
      ),
      body: GetBuilder<MyProvider>(
        init: MyProvider(),
        builder: (getx) => getx.details.data.data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getx.details.data.data.length,
                itemBuilder: (context, index) => Card(
                    color: Colors.grey,
                    child: Text(
                      getx.details.data.data[index].name,
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
              ),
      ),
    );
  }
}
