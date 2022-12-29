// ignore_for_file: file_names

import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getHelpRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    MangeAPi.getHelpQuestions,
  );

  return respons;
}

getFavoritRespon(String idUser) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${MangeAPi.getfavouritePlaces}/$idUser',
  );

  return respons;
}
