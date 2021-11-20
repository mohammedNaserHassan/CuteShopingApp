class UserEnter{
bool status;
String message;
UserData data;

UserEnter.fromJson(Map<String,dynamic> map){
  status = map['status'];
  message = map['message'];
  data = map['data']!=null?UserData.fromJson(map['data']):null;
}
}
class UserData{
  int id;
  String name,email,phone,image,token;
  int points,credit;

  UserData(this.id, this.name, this.email, this.phone, this.image, this.token,
      this.points, this.credit);

UserData.fromJson(Map<String,dynamic> map){
  id = map['id'];
  name = map['name'];
  email = map['email'];
  phone = map['phone'];
  image = map['image'];
  token = map['token'];
  points = map['points'];
  credit = map['credit'];
}
}