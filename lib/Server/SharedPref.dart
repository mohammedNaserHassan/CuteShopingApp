import 'package:shared_preferences/shared_preferences.dart';

class Helper{
  Helper._();
  static Helper x =Helper._();
  SharedPreferences sharedPreferences;

  initSharedPreference()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }
  SaveUsername(bool  name){
    sharedPreferences.setBool('name', name);
  }
  bool  GetUsername(){
    return sharedPreferences.getBool('name')??false;
  }

  SaveToken(String  token){
    sharedPreferences.setString('token', token);
  }
  String  GetToken(){
    return sharedPreferences.getString('token')??'';
  }
}
