class HomeModel {
  bool status;
  HomeData data;

  HomeModel.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    data = HomeData.fromJson(map['data']);
  }
}

class HomeData {
  List<ProductsModel> products = [];
  List<BannerModel> banners = [];

  HomeData.fromJson(Map<dynamic, dynamic> map) {
    map['banners'].forEach((element) {
      banners.add(element);
    });
    map['products'].forEach((element) {
      products.add(element);
    });
  }
}

class ProductsModel {
  int id;
  dynamic price, old_price, discount;
  String image, name;
  bool in_favorites, in_cart;

  ProductsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    price = map['price'];
    old_price = map['old_price'];
    discount = map['discount'];
    image = map['image'];
    in_favorites = map['in_favorites'];
    in_cart = map['in_cart'];
    name = map['name'];
  }
}

class BannerModel {
  int id;
  String image;

  BannerModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['image'];
  }
}
