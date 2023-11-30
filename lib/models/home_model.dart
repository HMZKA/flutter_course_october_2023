class HomeModel {
  Data? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json["data"]);
  }
}

class Data {
  List<Banners> banners = [];
  List<Products> products = [];
  Data.fromJson(Map<String, dynamic> json) {
    json["banners"].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
    json["products"].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}

class Banners {
  int? id;
  String? image;
  Banners.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
  }
}

class Products {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String> images = [];
  bool? inFavorites;
  bool? inCart;
  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"].floor();
    oldPrice = json["old_price"].floor();
    description = json["description"];
    discount = json["discount"].floor();
    image = json["image"];
    name = json["name"];
    inFavorites = json["in_favorites"];
    inCart = json["in_cart"];
    json["images"].forEach((element) {
      images.add(element);
    });
  }
}
