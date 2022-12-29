import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getSearchRespon(String textsearch) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${MangeAPi.searchBytext}=$textsearch',
  );
  print(respons);
  return respons;
}
