// ignore_for_file: file_names

import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/main.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getTypesRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    MangeAPi.getHotelTypes,
  );
  print(respons);
  return respons;
}

getDataOfcatoRespon(String cato) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${MangeAPi.nearestPlaces}?userId=${sharedPreferences.getString('id')}&category=$cato;',
  );
  print(respons);
  return respons;
}
