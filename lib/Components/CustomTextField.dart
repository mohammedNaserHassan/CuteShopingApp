import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/GetX/MyProvider.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  Function validate;
  String label;
  bool obs, suf;
  Widget prefex;

  CustomTextField(
      {this.controller,
      this.label,
      this.prefex,
      this.validate,
      this.type = TextInputType.text,
      this.obs = false,
      this.suf = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Container(
        height: 60,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).textTheme.bodyText2.color),
        child: TextFormField(
          style: TextStyle(color: Colors.grey),
          obscureText: obs,
          onSaved: validate,
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.blue),
              border: InputBorder.none,
              labelText: label,
              prefix: prefex,
              suffixIcon: suf
                  ? IconButton(
                      onPressed: () {
                        provider.unRead();
                      },
                      icon: provider.read
                          ? Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                          : Icon(Icons.visibility_off),
                    )
                  : null),
        ),
      ),
    );
  }
}
