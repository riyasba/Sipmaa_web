import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/services/base_url.dart';
import 'package:reg_login/app/data/models/register_model.dart';
//import 'package:simpa/models/register_model.dart';
//import 'package:simpa/services/base_urls/base_urls.dart';
import 'package:http/http.dart' as http;

class RegisterServicesApi extends BaseApiService {



  Future registerApi(RegisterModel registerModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      

      var response = await dio.post(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
                    'Access-Control-Allow-Origin': '*', // Replace * with your allowed origin
                  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, DELETE', // Add allowed HTTP methods
                  'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token' // Add allowed 
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
      print("::::::::<Register>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }


  //http code
  
  Future registerApiTest(RegisterModel registerModel) async {
    dynamic responseJson;
    try {

      var body = {
            "name": registerModel.name,
            "lastname": registerModel.lastname,
            "username": registerModel.username,
            "email": registerModel.email,
            "mobile": registerModel.mobile,
            "password": registerModel.password,
            "password_confirmation": registerModel.password
          };

      var headers = {
                'Accept': 'application/json',
                    'Access-Control-Allow-Origin': '*', // Replace * with your allowed origin
                  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, DELETE', // Add allowed HTTP methods
                  'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token' // Add allowed 
              };


              var urls = "https://admin.e-sankalp.com/public/api/planet";
     
     
 var response = await   http.post( Uri.parse(registerURl),body:body, headers:  headers);
      
      print("::::::::<Register URL>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.body);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }


   
  Future registerApiTest2(RegisterModel registerModel) async {
    dynamic responseJson;
    try {

      var body = {
            "name": registerModel.name,
            "lastname": registerModel.lastname,
            "username": registerModel.username,
            "email": registerModel.email,
            "mobile": registerModel.mobile,
            "password": registerModel.password,
            "password_confirmation": registerModel.password
          };

      var headers = {
                'Accept': 'application/json',
                    'Access-Control-Allow-Origin': '*', // Replace * with your allowed origin
                  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, DELETE', // Add allowed HTTP methods
                  'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token' // Add allowed 
              };


              var urls = "https://demo.generation360tech.in/";
     
     
     var response = await   http.get( Uri.parse(urls), headers:  headers);
      
      print("::::::::<Register URL>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.body);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }





  Future testing(RegisterModel registerModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      

      var response = await dio.get(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
         );
      print("::::::::<Register>::::::::status code::::::::::");
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
// import 'package:dio/dio.dart';
// import 'dart:convert';

// import '../../models/register_model.dart';

// Future registerApi(RegisterModel registerModel) async {
//   dynamic responseJson;
//   try {
//     var url = 'https://sipmaa.batechnology.in.net/api/register_user'; // Replace with your Laravel API endpoint URL
    
//     var dio = Dio();
//     dio.options.headers = {
//       'Accept': 'application/json',
//       'Access-Control-Allow-Origin': '*', // Replace * with your allowed origin
//       'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, DELETE', // Add allowed HTTP methods
//       'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token' // Add allowed headers
//     };

//     var data = {
//       'name': registerModel.name,
//       'lastname': registerModel.lastname,
//       'username': registerModel.username,
//       'email': registerModel.email,
//       'mobile': registerModel.mobile,
//       'password': registerModel.password,
//       'password_confirmation': registerModel.password
//     };

//     var response = await dio.post(url, data: jsonEncode(data));
    
//     print("::::::::<Register>::::::::status code::::::::::");
//     print(response.statusCode);
//     print(response.data);
    
//     responseJson = response.data;
//   } on DioError catch (e) {
//     // Error occurred
//     print('An error occurred during user registration: ${e.message}');
//     if (e.response != null) {
//       print('Response data: ${e.response!.data}');
//       print('Response headers: ${e.response!.headers}');
//     }
//   } catch (e) {
//     // Other exceptions
//     print('An error occurred during user registration: $e');
//   }
  
//   return responseJson;
// }