// ignore_for_file: file_names
import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

loginRespons(
  String email,
  String password,
) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    MangeAPi.login,
    {
      'email': email,
      'password': password,
    },
    encode: true,
  );
  return respons;
}

SignUpRespons({
  required String email,
  required String password,
  required String username,
  required String country,
  required String city,
  required String phone,
  required String repassword,
}) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
      MangeAPi.login,
      {
        "username": username,
        "email": email,
        "password": password,
        "repassword": repassword,
        "country": country,
        "city": city,
        "phone": phone
      },
      encode: true);
  return respons;
}
