import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoping/Components/CustomButton.dart';
import 'package:shoping/Components/CustomTextField.dart';
import 'package:shoping/GetX/MyProvider.dart';
import 'package:shoping/GetX/getStorage.dart';
import 'package:shoping/UI/LoginScreen.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Register Page', style: Theme.of(context).textTheme.bodyText2),
              Text(
                'Register now to easy log in to our app.',
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
                controller: provider.name,
                label: 'Full Name',
                prefex: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.grey,
                ),
                validate: (String text) {
                  if (text.isEmpty) {
                    return 'please enter your name';
                  }
                },
              ),
              CustomTextField(
                controller: provider.phone,
                label: 'Phone Number',
                prefex: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                type: TextInputType.emailAddress,
                validate: (String text) {
                  if (text.isEmpty) {
                    return 'please enter your phone number';
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
              CustomButton(text: 'Register',
              function: (){
                provider.userRegister();
              },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5,),
                  TextButton(
                    onPressed: (){
                      Get.offAll(LoginScreen());
                    },
                    child: Text(
                      'Login',
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
      ),
    );
  }
}
