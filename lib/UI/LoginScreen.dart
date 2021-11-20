import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoping/Components/CustomButton.dart';

import 'package:shoping/Components/CustomTextField.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/GetX/getStorage.dart';
import 'package:shoping/UI/MainPage.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login Page', style: Theme.of(context).textTheme.bodyText2),
            Text(
              'Login now to browse our hot offers.',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: provider.email,
              label: 'Email Address',
              prefex: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              type: TextInputType.emailAddress,
              validate: (String text) {
                if (text.isEmpty) {
                  return 'please enter your email address';
                }
              },
            ),
            CustomTextField(
              controller: provider.password,
              label: 'Password',
              prefex: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              obs: provider.read,
              suf: true,
              type: TextInputType.visiblePassword,
              validate: (String text) {
                if (text.isEmpty) {
                  return 'please enter your password';
                }
              },
            ),
            CustomButton(text: 'LOGIN',
            function:(){
              provider.userLogin();
            },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(width: 5,),
                TextButton(
                  onPressed: (){
                    Get.offAll(RegisterScreen());
                  },
                  child: Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
