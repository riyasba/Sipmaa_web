import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/services/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ForgetPwdVerifyOtpApiServices extends BaseApiService {
  Future forgetPwdVerifyOtpApiServices(
      {required String otp}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("data");

      var datas = {
             "user_id": userId,
             "otp": otp
          };

          print("$verifyOtp response sending ========= $datas");

      var response = await dio.post(verifyOtp,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: datas);
          print("::::::::<verify - otp api>:::$userId:::::$otp::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }




   verifyOTP2() async{

    var response = await http.get(Uri.parse(verifyOtp),
    headers: {
      'Content-Type': 'application/json',
            
    },
    
    );

   }

  
}
