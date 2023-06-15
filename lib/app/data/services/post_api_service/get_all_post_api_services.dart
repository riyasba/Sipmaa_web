import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/services/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:simpa/models/register_model.dart';
//import 'package:simpa/services/base_urls/base_urls.dart';

import '../../../services/base_urls/base_urls.dart';

class GetAllPostApiServices extends BaseApiService {
  Future getAllPostApiServices() async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.get(
        getAllPostsURL,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $authtoken',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );
      print("::::::::<get all post Api>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
