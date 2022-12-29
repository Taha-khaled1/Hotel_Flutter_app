import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/data/functions_response/get_by_type.dart';
import 'package:hotelbooking/main.dart';
import 'package:hotelbooking/models/models_type.dart';

class HotelBytypeController extends GetxController {
  HouseTypeModels? helpModel1;
  late StatusRequest statusRequest;
  getdataSearch(String type) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await getHotelByTypeRespon(type);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        helpModel1 = await HouseTypeModels.fromJson(response);
      } else {
        print('erorr');
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getdataSearch(sharedPreferences.getString('type') ?? 'فندق');
    super.onInit();
  }
}
