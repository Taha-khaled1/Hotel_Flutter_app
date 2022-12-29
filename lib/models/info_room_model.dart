class InfoRoomModel {
  Room? room;
  List<RelatedRooms>? relatedRooms;
  UserContactInfo? userContactInfo;

  InfoRoomModel({this.room, this.relatedRooms, this.userContactInfo});

  InfoRoomModel.fromJson(Map<String, dynamic> json) {
    room = json['Room'] != null ? new Room.fromJson(json['Room']) : null;
    if (json['relatedRooms'] != null) {
      relatedRooms = <RelatedRooms>[];
      json['relatedRooms'].forEach((v) {
        relatedRooms!.add(new RelatedRooms.fromJson(v));
      });
    }
    userContactInfo = json['UserContactInfo'] != null
        ? new UserContactInfo.fromJson(json['UserContactInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['Room'] = this.room!.toJson();
    }
    if (this.relatedRooms != null) {
      data['relatedRooms'] = this.relatedRooms!.map((v) => v.toJson()).toList();
    }
    if (this.userContactInfo != null) {
      data['UserContactInfo'] = this.userContactInfo!.toJson();
    }
    return data;
  }
}

class Room {
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
  List<String>? features;
  bool? featured;
  int? bookingNumber;
  List<String>? unavailableDates;
  List<String>? category;
  List<Feedbacks>? feedbacks;
  List<String>? roomNumbers;
  String? imgs;
  int? discount;

  Room(
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
      this.features,
      this.featured,
      this.bookingNumber,
      this.unavailableDates,
      this.category,
      this.feedbacks,
      this.roomNumbers,
      this.imgs,
      this.discount});

  Room.fromJson(Map<String, dynamic> json) {
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
    features = json['features'].cast<String>();
    featured = json['featured'];
    bookingNumber = json['bookingNumber'];
    unavailableDates = json['unavailableDates'].cast<String>();
    category = json['category'].cast<String>();
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(new Feedbacks.fromJson(v));
      });
    }
    roomNumbers = json['roomNumbers'].cast<String>();
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
    data['features'] = this.features;
    data['featured'] = this.featured;
    data['bookingNumber'] = this.bookingNumber;
    data['unavailableDates'] = this.unavailableDates;
    data['category'] = this.category;
    if (this.feedbacks != null) {
      data['feedbacks'] = this.feedbacks!.map((v) => v.toJson()).toList();
    }
    data['roomNumbers'] = this.roomNumbers;
    data['imgs'] = this.imgs;
    data['discount'] = this.discount;
    return data;
  }
}

class Feedbacks {
  String? date;
  String? review;
  int? rating;

  Feedbacks({this.date, this.review, this.rating});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['review'] = this.review;
    data['rating'] = this.rating;
    return data;
  }
}

class RelatedRooms {
  String? sId;
  String? title;
  int? price;
  String? city;
  int? averageRating;
  String? imgs;

  RelatedRooms(
      {this.sId,
      this.title,
      this.price,
      this.city,
      this.averageRating,
      this.imgs});

  RelatedRooms.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    city = json['city'];
    averageRating = json['averageRating'];
    imgs = json['imgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['city'] = this.city;
    data['averageRating'] = this.averageRating;
    data['imgs'] = this.imgs;
    return data;
  }
}

class UserContactInfo {
  String? sId;
  String? username;
  String? email;
  String? img;
  String? phone;

  UserContactInfo({this.sId, this.username, this.email, this.img, this.phone});

  UserContactInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    img = json['img'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['img'] = this.img;
    data['phone'] = this.phone;
    return data;
  }
}
