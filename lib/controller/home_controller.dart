import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/data/functions_response/get_cities.dart';
import 'package:hotelbooking/data/functions_response/get_top_boking.dart';
import 'package:hotelbooking/data/functions_response/get_top_reating.dart';
import 'package:hotelbooking/data/functions_response/get_types.dart';
import 'package:hotelbooking/data/functions_response/main_selectiom_res.dart';
import 'package:hotelbooking/models/cities_model.dart';
import 'package:hotelbooking/models/get_top_reating_model.dart';
import 'package:hotelbooking/models/minslection_models.dart';
import 'package:hotelbooking/models/types_model.dart';

class HomeController extends GetxController {
  GetTopReatingModel? getTopReatingModel;
  GetTopReatingModel? getTopBokingModel;
  CitisModel? getCitesModel;
  TypesModel? getTypesModel;
  late StatusRequest statusRequest;
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest2;
  late StatusRequest statusRequest3;
  GetUserCatogerys? getusercatogerys;
  late StatusRequest statusRequest4;

  getUserCatogerys() async {
    statusRequest4 = StatusRequest.loading;
    update();
    var response = await getUserCatogeryRespon();
    statusRequest4 = handlingData(response);
    if (StatusRequest.success == statusRequest4) {
      getusercatogerys = await GetUserCatogerys.fromJson(response);
      print('getTopReatingModel');
    } else {
      print('erorr');
    }
    update();
  }

  getdataTopreating() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getTopReating();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getTopReatingModel = await GetTopReatingModel.fromJson(response);
      print('getTopReatingModel');
    } else {
      print('erorr');
    }
    update();
  }

  getdataBoking() async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await getTopBoking();
    statusRequest1 = handlingData(response);
    if (StatusRequest.success == statusRequest1) {
      getTopBokingModel = await GetTopReatingModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  getCiteisdata() async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await getCitesRespon();
    statusRequest2 = handlingData(response);
    if (StatusRequest.success == statusRequest2) {
      getCitesModel = await CitisModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  getTypesdata() async {
    statusRequest3 = StatusRequest.loading;
    update();
    var response = await getTypesRespon();
    statusRequest3 = handlingData(response);
    if (StatusRequest.success == statusRequest3) {
      getTypesModel = await TypesModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  @override
  void onInit() {
    getdataTopreating();
    getdataBoking();
    getCiteisdata();
    getTypesdata();
    getUserCatogerys();
    super.onInit();
  }
}
