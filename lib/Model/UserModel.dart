
class ShoppingModel{
  bool status;
  String message;
  UserModel data;
  ShoppingModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    message=json['message'];
    data=json['data']!=null?UserModel.fromJson(json['data']):null;
  }
}
class UserModel{
  int id;
  String name,email,phone,image,token;
  int points,credits;
  UserModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
    credits=json['credits'];
    points=json['points'];
  }
}