import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/models/department_model.dart';
import 'package:reg_login/app/data/models/industries_model.dart';
import 'package:reg_login/app/data/models/profile_update_model.dart';
import 'package:reg_login/app/data/services/auth_api_service/check_email_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/get_department_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/get_industries_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/otp_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/register_otp_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/send_email_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/update_profile_api_service.dart';
import 'package:reg_login/app/modules/authentication/OTP/views/otp.dart';
import 'package:reg_login/app/modules/authentication/register/views/register.dart';
import 'package:reg_login/app/modules/authentication/register/views/registersplash.dart';
import 'package:reg_login/app/routes/app_pages.dart';
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
import '../../../responsive/view/otp_page.dart';
import '../../../responsive/view/mob_register_details_page.dart';
import '../../models/slider_model.dart';
import '../../services/auth_api_service/get_industries_api_services.dart';
import '../../services/auth_api_service/login_api_services.dart';
import '../../models/register_model.dart';

class AuthController extends GetxController {
  RxBool isDesignationSelected = false.obs;
  RxBool isInduaturesSelected = false.obs;
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
 SendVerificationApiService sendVerificationApiService =
      SendVerificationApiService();

  CheckVerificationApiService checkVerificationApiService =
      CheckVerificationApiService();
   GetIndustriesApiServices getIndustriesApiServices =
      GetIndustriesApiServices();
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
      //await prefs.setString("auth_token", response.data["token"]);
      await prefs.setString("temp_auth_token", response.data["token"]);
      await prefs.setString("verify", "false");
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
      //    mobile: ,
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
      final prefs = await SharedPreferences.getInstance();
      String? tempAuthToken = prefs.getString("temp_auth_token");
      await prefs.setString("auth_token", tempAuthToken!);
      if (isMobile) {
        Get.to(ResgisterDetailsWeb());
      } else {
        Get.to(RegisterDetailsMobView());
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

  RegisterOtpVerifyServicesApi registerOtpVerifyServicesApi =
      RegisterOtpVerifyServicesApi();

  registerOtpVerify(String otp, bool isMobile) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await registerOtpVerifyServicesApi.registerotpVerifyApi(otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      String? tempAuthToken = prefs.getString("temp_auth_token");
      await prefs.setString("auth_token", tempAuthToken!);
      if (isMobile) {
        Get.to(ResgisterDetailsWeb());
      } else {
        Get.to(RegisterDetailsMobView());
      }
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
      // await prefs.setString("verify", "true");
      Get.off(Registersplash());
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
        Get.offAllNamed('/home-screen');
      } else {
        Get.offAllNamed(Routes.HOME_PAGE);
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
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }else {
      Get.rawSnackbar(
        messageText: const Text(
          "Invalid User name / Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }}

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
  
  List<Industry> industriesList = [];

  getIndustriesList() async {
    dio.Response<dynamic> response =
        await getIndustriesApiServices.getIndustriePostApiServices();

    if (response.statusCode == 200) {
      IndustriesModel departmentModel = IndustriesModel.fromJson(response.data);
      industriesList = departmentModel.industries;
      update();
    }
  }



    sendEmailVerification({required String emailId}) async {
    bool isEmailSent = false;
    dio.Response<dynamic> response =
        await sendVerificationApiService.sendVerification(emailId: emailId);

    if (response.statusCode == 200) {
      isEmailSent = true;
      Get.rawSnackbar(
          messageText: Text(
            "Email verification link sent",
            style: primaryfont.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      isEmailSent = false;
      Get.rawSnackbar(
          messageText: Text(
            "Email is Already Verified or Taken",
            style: primaryfont.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red);
    }

    return isEmailSent;



    
  }
    checkEmailVerification({required String emailId}) async {
    bool isverified = false;
    dio.Response<dynamic> response =
        await checkVerificationApiService.checkVerification(emailId: emailId);

    if (response.statusCode == 200) {
      if (response.data["status"] == 1) {
        isverified = true;
      } else {
        isverified = false;
      }
    } else {
      isverified = false;
    }

    return isverified;
  }
}



