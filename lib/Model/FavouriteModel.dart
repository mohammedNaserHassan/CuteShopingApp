class FavouritesModel {
  bool status;
  Data data;


  FavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =  Data.fromJson(json['data']);
  }

}

class Data {
  int currentPage;
  List<FavouriteData> data;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

      json['data'].forEach((v) {
        data.add(new FavouriteData.fromJson(v));
      });
    }
}

class FavouriteData {
  int id;
  Product product;

  FavouriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}
