class FavoriteModel {
  List<FavouritePlaces>? favouritePlaces;

  FavoriteModel({this.favouritePlaces});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favouritePlaces'] != null) {
      favouritePlaces = <FavouritePlaces>[];
      json['favouritePlaces'].forEach((v) {
        favouritePlaces!.add(new FavouritePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favouritePlaces != null) {
      data['favouritePlaces'] =
          this.favouritePlaces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouritePlaces {
  String? sId;
  String? title;
  String? type;
  int? price;
  int? maxPeople;
  String? desc;
  String? city;
  String? address;
  int? destanceFromCityCenter;
  int? averageRating;
  String? imgs;
  int? discount;

  FavouritePlaces(
      {this.sId,
      this.title,
      this.type,
      this.price,
      this.maxPeople,
      this.desc,
      this.city,
      this.address,
      this.destanceFromCityCenter,
      this.averageRating,
      this.imgs,
      this.discount});

  FavouritePlaces.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    maxPeople = json['maxPeople'];
    desc = json['desc'];
    city = json['city'];
    address = json['address'];
    destanceFromCityCenter = json['destanceFromCityCenter'];
    averageRating = json['averageRating'];
    imgs = json['imgs'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['price'] = this.price;
    data['maxPeople'] = this.maxPeople;
    data['desc'] = this.desc;
    data['city'] = this.city;
    data['address'] = this.address;
    data['destanceFromCityCenter'] = this.destanceFromCityCenter;
    data['averageRating'] = this.averageRating;
    data['imgs'] = this.imgs;
    data['discount'] = this.discount;
    return data;
  }
}
