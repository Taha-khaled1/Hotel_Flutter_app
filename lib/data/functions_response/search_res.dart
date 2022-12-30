import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getSearchRespon(String textsearch) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${MangeAPi.searchBytext}=$textsearch',
  );

  return respons;
}

getFiltterRespon({
  String? city,
  int? maxprice,
  int? minprice,
  List<String>? x,
  String? type,
  int? distance,
}) async {
  print(
      '->city $city <- maxprice: $maxprice minprice: $minprice :x $x :type $type distance: $distance ');
  Curd curd = Curd();
  var respons = await curd.postrequest(
    MangeAPi.roomsFilter,
    {
      "city": city ?? "نابلس",
      "maxPrice": maxprice ?? 1000,
      "minPrice": minprice ?? 0,
      "features": x ?? ["مسابح", "wifi"],
      "type": type ?? "فندق",
      "distance": distance ?? 0
    },
    encode: true,
  );
  print(respons);
  return respons;
}
