import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:reg_login/app/data/models/department_model.dart';
import 'package:reg_login/app/data/models/profile_update_model.dart';
import 'package:reg_login/app/data/services/auth_api_service/get_department_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/otp_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/update_profile_api_service.dart';
import 'package:reg_login/app/modules/authentication/OTP/views/otp.dart';
import 'package:reg_login/app/modules/authentication/register/views/register.dart';
import 'package:reg_login/app/modules/authentication/register/views/registersplash.dart';
import 'package:reg_login/app/services/network_api_services/auth_api_services/register_api_services.dart';
import 'package:reg_login/app/services/network_api_services/user_name_check_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simpa/models/department_model.dart';
// import 'package:simpa/models/profile_update_model.dart';
// import 'package:simpa/models/register_model.dart';
// import 'package:simpa/models/slider_model.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/get_departments_api_services.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/get_slider_api_services.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/login_api_services.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/register_api_services.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/update_profile_api_services.dart';
// import 'package:simpa/services/network_api_services/auth_api_services/user_name_check_api_services.dart';
// import 'package:simpa/view/otp_page.dart';
// import 'package:simpa/view/register_details_page.dart';
// import 'package:simpa/view/register_splash.dart';
// import 'package:simpa/widgets/bottumnavigationbar.dart';

// import '../services/network_api_services/auth_api_services/otp_verify_api_services.dart';
import 'package:dio/dio.dart' as dio;

import '../../../get_slider_api_services.dart';
import '../../../modules/screens/home/views/home_screen.dart';
import '../../../responsive/view/home_respo.dart';
import '../../../responsive/view/otp_page.dart';
import '../../../responsive/view/register_details_page.dart';
import '../../models/slider_model.dart';
import '../../services/auth_api_service/login_api_services.dart';
import '../../models/register_model.dart';

class AuthController extends GetxController {
  RxBool isDesignationSelected = false.obs;
  RxBool isLoading = false.obs;
  RxInt selctedIndex = 100.obs;

  RxBool isUserNameAvailable = false.obs;

  List<Department> departments = [];
  List<SliderList> sliderList = [];

  GetDepartmentServicesApi getDepartmentServicesApi =
      GetDepartmentServicesApi();
  LoginServicesApi loginServicesApi = LoginServicesApi();

  /// OtpVerifyServicesApi otpVerifyServicesApi = OtpVerifyServicesApi();
  OtpVerifyServicesApi otpVerifyServicesApi = OtpVerifyServicesApi();
  RegisterServicesApi registerServicesApi = RegisterServicesApi();
  ProfileUpdateServicesApi profileUpdateServicesApi =
      ProfileUpdateServicesApi();
  UserNameApiServices userNameApiServices = UserNameApiServices();
  GetSliderApiServices getSliderApiServices = GetSliderApiServices();

  // registerUser(RegisterModel registerModel) async {
  //   print("---------------------------------2-----------");
  //   isLoading(true);
  //   dio.Response<dynamic> response =
  //       await registerServicesApi.testing(registerModel);
  //   isLoading(false);
  //   print("---------------------------------3-----------");
  //   print(response.data);

  //   if (response.statusCode == 201) {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString("auth_token", response.data["token"]);
  //     // Get.off(otp_page(
  //     //   phoneNumber: registerModel.mobile,
  //     //   otp: response.data["user"]["otp"].toString(),
  //     // )
  //    // );
  //   } else if (response.statusCode == 422) {
  //     Get.rawSnackbar(
  //       messageText: Text(
  //         response.data["errors"].first,
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //       backgroundColor: Colors.red,
  //     );
  //   }
  // }

  registerUser(RegisterModel registerModel, bool isMobile) async {
    isLoading(true);
    var response = await registerServicesApi.registerApi(registerModel);
    isLoading(false);

    if (response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      if (isMobile) {
        Get.to(otp_page(
          phoneNumber: registerModel.mobile,
          otp: response.data["user"]["otp"].toString(),
        ));
        //mobile
      } else {
        Get.to(OTPVIEWS(
          phoneNumber: registerModel.mobile,
          otp: response.data["user"]["otp"].toString(),
        ));
        //desk
      }

      // Get.to(OTPVIEWS(
      //   phoneNumber: registerModel.mobile,
      //   otp: response.data["user"]["otp"].toString(),
      // ));
      // Get.toNamed('/otp-views',arguments:
      // {
      //   "otp": response.data["user"]["otp"].toString(),
      //   "phonenumber": registerModel.mobile
      // }
      // );
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["errors"].first,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  otpVerify(String otp, bool isMobile) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await otpVerifyServicesApi.otpVerifyApi(otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      if (isMobile) {
        Get.to(Resgister2());
      } else {
        Get.to(RegisterDetailsView());
      }

      //Get.offAll(const Resgister2());
      //success
      Get.rawSnackbar(
        messageText: const Text(
          "OTP Verified Successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
        messageText: const Text(
          "Invalid OTP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  getDepartmentList() async {
    dio.Response<dynamic> response =
        await getDepartmentServicesApi.getDepartmentApi();

    if (response.statusCode == 200) {
      DepartmentModel departmentModel = DepartmentModel.fromJson(response.data);
      departments = departmentModel.departments;
      update();
    }
  }

  updateProfile(ProfileUpdateModel profileUpdateModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await profileUpdateServicesApi.profileUpdate(profileUpdateModel);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      Get.offAll(Registersplash());
      Get.rawSnackbar(
        messageText: const Text(
          "Registered Successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  loginUser(
      {required String username,
      required String password,
      required double size}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginServicesApi.loginApi(username: username, password: password);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      if (size < 600) {
        Get.toNamed('/home-screen');
      } else {
        Get.offAll(() => HomePage());
      }

      Get.rawSnackbar(
        messageText: const Text(
          "Login Successful",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["error"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  checkUserName({required String userName}) async {
    dio.Response<dynamic> response =
        await userNameApiServices.username(userName: userName);

    if (response.statusCode == 200) {
      isUserNameAvailable(true);
      update();
    } else if (response.statusCode == 409) {
      isUserNameAvailable(false);
      update();
    }
  }

  getSlider() async {
    dio.Response<dynamic> response = await getSliderApiServices.getSliders();

    if (response.statusCode == 201) {
      update();
      SliderModel sliderModel = SliderModel.fromJson(response.data);
      sliderList = sliderModel.sliderList;
    }
    update();
  }
}
