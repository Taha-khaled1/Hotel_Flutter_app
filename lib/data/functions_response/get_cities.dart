// ignore_for_file: file_names

import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getCitesRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    MangeAPi.getCities,
  );
  print(respons);
  return respons;
}

getDataForfiltterRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    'https://hotel-booking-8qw1.onrender.com/api/rooms/getDataForFilter',
  );
  print(respons);
  return respons;
}

class DataforFiltterModel {
  List<int>? prices;
  List<String>? features;
  List<int>? destanceFromCityCenter;
  List<String>? typeOfAccommodation;

  DataforFiltterModel(
      {this.prices,
      this.features,
      this.destanceFromCityCenter,
      this.typeOfAccommodation});

  DataforFiltterModel.fromJson(Map<String, dynamic> json) {
    prices = json['prices'].cast<int>();
    features = json['features'].cast<String>();
    destanceFromCityCenter = json['destanceFromCityCenter'].cast<int>();
    typeOfAccommodation = json['typeOfAccommodation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prices'] = this.prices;
    data['features'] = this.features;
    data['destanceFromCityCenter'] = this.destanceFromCityCenter;
    data['typeOfAccommodation'] = this.typeOfAccommodation;
    return data;
  }
}
