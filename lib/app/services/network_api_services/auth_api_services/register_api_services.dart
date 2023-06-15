import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/models/register_model.dart';
import 'package:reg_login/app/services/base_urls/base_urls.dart';

import '../../../data/services/base_url.dart';

class RegisterServicesApi extends BaseApiService {
  Future registerApi(RegisterModel registerModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
    print("_____________________Changes ^^ ${ registerModel.name}^^_____________________________");
      var response = await dio.post(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "name": registerModel.name,
            "lastname": registerModel.lastname,
            "username": registerModel.username,
            "email": registerModel.email,
            "mobile": registerModel.mobile,
            "password": registerModel.password,
            "password_confirmation": registerModel.password
          });
      print("::::::::<Register new>::::::::status code:::::${registerModel.name}:::${registerModel.mobile}::");
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
