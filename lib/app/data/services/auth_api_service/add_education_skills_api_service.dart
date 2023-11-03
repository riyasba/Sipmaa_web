import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/services/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEducationSkillssApiServices extends BaseApiService {
  Future addEducationalSkills(
      {required String institutionname,
      required String educationtitle,
      required String city,
      required String state,
      required String frombatch,
      required String educationdescription,
      required String flag,
      required String tilldate}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      String? userId = prefs.getString("user_id");

      var response = await dio.post(addeducationskillUrl,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "user_id": userId,
            "institution_name": institutionname,
            "education_title": educationtitle,
            "education_description": educationdescription,
            "city": city,
            "state": state,
            "from_batch": frombatch,
            "till_date": tilldate,
            "flag": flag
          });
          print("........add education skill.....//");
      print("..........$userId");
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
