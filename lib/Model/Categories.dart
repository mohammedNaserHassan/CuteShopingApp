class Categories{
  bool status;
  CategoriesData data;
  Categories.fromJson(Map<String,dynamic> map){
    status=map['status'];
    data= CategoriesData.fromJson(map['data']);
  }
}
class CategoriesData{
  int current_page;
  List<DateModel> data=[];
  CategoriesData.fromJson(Map<String,dynamic>map){
    current_page=map['current_page'];
    map['data'].forEach(
        (element){
          data.add(DateModel.fromJson(element));
        }
    );
  }
}
class DateModel{
  int id;
  String name;
  String image;
  DateModel.fromJson(Map<String,dynamic>map){
    id=map['id'];
    name=map['name'];
    image=map['image'];
  }
}