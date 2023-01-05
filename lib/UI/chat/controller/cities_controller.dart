import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:dio/dio.dart';
import 'package:hotelbooking/model/api/api.dart';

class CitiesController extends GetxController {
  Api api = Api();
  Future<List?>? getData({String apiPath = "hotels/getCities"}) async {
    Response? response;
    response = await api.request(
      apiPath: apiPath,
      isGet: true,
    );
    if (response == null) {
      print("cities Error");
      throw ("cities Error 1");
      // return null;
    } else {
      if (response.statusCode != 200) {
        Fluttertoast.showToast(
          msg: "بيانات تالفة != 200",
          backgroundColor: Colors.red,
          textColor: Colors.black,
        );
        return null;
      }
      if (response.data['message'] is List) {
        return response.data['message'];
      } else {
        Fluttertoast.showToast(
          msg: "بيانات ليست من نوع مصفوفة",
          backgroundColor: Colors.red,
          textColor: Colors.black,
        );
        return null;
      }
    }
  }

  Future<String?> addData({
    String apiPath = "admin/addCity",
    required Map<String, dynamic> params,
    List<File>? files,
  }) async {
    Response? response;
    response = await api.request(
      apiPath: apiPath,
      isGet: false,
      params: params,
      files: files,
    );

    if (response == null) {
      return null;
    } else {
      if (response.statusCode != 200) {
        Fluttertoast.showToast(
          msg: "بيانات تالفة != 200",
          backgroundColor: Colors.red,
          textColor: Colors.black,
        );
        return null;
      }
      if (response.data['message'] is String) {
        return response.data['message'];
      } else {
        Fluttertoast.showToast(
          msg: "بيانات ليست من نوع نص",
          backgroundColor: Colors.red,
          textColor: Colors.black,
        );
        return null;
      }
    }
  }
}
