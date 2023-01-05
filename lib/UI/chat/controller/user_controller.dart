import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  late String userId, email, name, phone, country, city;

  UserModel(
    this.email,
    this.name,
    this.userId,
    this.phone,
    this.country,
    this.city,
  );

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"];
    email = map["email"];
    name = map["name"];
    city = map['city'];
    phone = map["phone"];
    country = map["country"];
  }
  toJson() {
    return {
      "userId": userId,
      "email": email,
      'city': city,
      "country": country,
      "name": name,
      "phone": phone,
    };
  }

  static const NUMBER = 'number';
  static const ID = 'id';
}
