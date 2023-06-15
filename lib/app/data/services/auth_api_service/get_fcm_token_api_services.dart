import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reg_login/app/data/services/base_url.dart';
import 'package:reg_login/app/services/base_urls/base_urls.dart';


class GetFcmTokenApiService extends BaseApiService {
  Future fcmTokenStoreApiService({required String id}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(fcmTokenStoreApiUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {"id": id});
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }
}
