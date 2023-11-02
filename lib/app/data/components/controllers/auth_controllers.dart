import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/data/models/city_list_model.dart';
import 'package:reg_login/app/data/models/department_model.dart';
import 'package:reg_login/app/data/models/industries_model.dart';
import 'package:reg_login/app/data/models/profile_update_model.dart';
import 'package:reg_login/app/data/models/skills_model.dart';
import 'package:reg_login/app/data/models/state_list_model.dart';
import 'package:reg_login/app/data/services/auth_api_service/add_education_skills_api_service.dart';
import 'package:reg_login/app/data/services/auth_api_service/check_email_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/get_department_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/get_industries_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/otp_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/professional_profile_update_api_service.dart';
import 'package:reg_login/app/data/services/auth_api_service/register_otp_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/send_email_verify_api_services.dart';
import 'package:reg_login/app/data/services/auth_api_service/student_update_profile_api_service.dart';
import 'package:reg_login/app/data/services/auth_api_service/student_update_profile_api_service.dart';
import 'package:reg_login/app/data/services/auth_api_service/userType_update_api_service.dart';
import 'package:reg_login/app/data/services/student_professional_type_api_service.dart';
import 'package:reg_login/app/modules/authentication/OTP/views/otp.dart';
import 'package:reg_login/app/modules/authentication/register/views/web_professional_register_details_screen.dart';
import 'package:reg_login/app/modules/authentication/register/views/web_student_register_details_screen.dart';
import 'package:reg_login/app/modules/authentication/register/views/registersplash.dart';
import 'package:reg_login/app/responsive/view/onboarding_view/professional_onboarding_screen.dart';
import 'package:reg_login/app/responsive/view/onboarding_view/student_onboarding_screen.dart';
import 'package:reg_login/app/services/network_api_services/auth_api_services/register_api_services.dart';
import 'package:reg_login/app/services/network_api_services/user_name_check_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import '../../../get_slider_api_services.dart';
import '../../../responsive/view/otp_page.dart';
import '../../../responsive/view/mob_register_details_page.dart';
import '../../models/requiremets_models.dart';
import '../../models/slider_model.dart';
import '../../services/auth_api_service/get_city_api_services.dart';
import '../../services/auth_api_service/get_requirements_list_api_services.dart';
import '../../services/auth_api_service/get_skills_api_services.dart';
import '../../services/auth_api_service/get_states_api_services.dart';
import '../../services/auth_api_service/login_api_services.dart';
import '../../models/register_model.dart';

class AuthController extends GetxController {
  RxBool isDesignationSelected = false.obs;
  RxBool isInduaturesSelected = false.obs;
  RxBool isLoading = false.obs;
  RxInt selctedIndex = 100.obs;
  RxInt wayIndex = 0.obs;
  RxInt professinalindex = 0.obs;
  RxBool isUserNameAvailable = false.obs;
  List<Department> departments = [];
  List<SliderList> sliderList = [];
  List<Requirement> requirementList = [];

  DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  List<StateList> stateList = [];
  List<CityList> cityList = [];
  GetDepartmentServicesApi getDepartmentServicesApi =
      GetDepartmentServicesApi();
  LoginServicesApi loginServicesApi = LoginServicesApi();
  GetRequirementsApiServices getRequirementsApiServices =
      GetRequirementsApiServices();

  /// OtpVerifyServicesApi otpVerifyServicesApi = OtpVerifyServicesApi();
  OtpVerifyServicesApi otpVerifyServicesApi = OtpVerifyServicesApi();
  RegisterServicesApi registerServicesApi = RegisterServicesApi();
  StudentProfileUpdateServicesApi profileUpdateServicesApi =
      StudentProfileUpdateServicesApi();
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
        Get.to(StudentResgisterDetailsWeb());
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
        if (wayIndex.value == 0) {
        Get.to(const StudentResgisterDetailsWeb());
      } else {
        Get.to(const ProfessionalResgisterDetailsWeb());
      }
      } else {
        Get.to(const RegisterDetailsMobView());
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

  //student professional
  StudentProfile studentProfile = StudentProfile();
  studentProfessionaltype({required String type}) async {
    dio.Response<dynamic> response =
        await studentProfile.studentProfile(type: type);
    if (response.statusCode == 200) {
      Get.offAll(const Registersplash());
    }
  }

    //existing user 
  eStudentProfessionaltype({required String type}) async {
    dio.Response<dynamic> response =
        await studentProfile.studentProfile(type: type);
    if (response.statusCode == 200) {
    }
  }

   //existing user - update user type
  UserTypeUpdateApiService userTypeUpdateApiService = UserTypeUpdateApiService();

  updateUserType({required String userType}) async {
    dio.Response<dynamic> response = await userTypeUpdateApiService.userTypeUpdateApiService(
      userType: userType);
      if(response.statusCode == 200){
        Get.back();
      }
  }

  AddEducationSkillssApiServices addeducationskillsapiservices =
      AddEducationSkillssApiServices();

  addEducationalSkills({
    required String institutionname,
    required String userId,
    required String educationtitle,
    required String city,
    required String state,
    required String frombatch,
    required String tilldate,
    required String educationdescription,
    required String flag,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addeducationskillsapiservices.addEducationalSkills(
            institutionname: institutionname,
            educationtitle: educationtitle,
            city: city,
            state: state,
            frombatch: frombatch,
            educationdescription: educationdescription,
            flag: flag,
            tilldate: tilldate);

    print("-------->>-----------<<-------->>>>>>>");
    print(response.data);
    isLoading(false);
    if (response.statusCode == 201) {
      Get.back();
      Get.find<ProfileController>().getEducationalSkillsApi();
      // getProfile();
      // if (isFromLogin) {
      //   Get.offAll(() => const SettingProfileMadatoryPage());
      // } else {
      //   Get.offAll(() => const SettingProfilePage());
      // }
      Get.rawSnackbar(
        messageText: const Text(
          "New Skill added",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Unable to add skill",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  //professional profile update
  ProfessionalProfileUpdateServicesApi professionalProfileUpdateServicesApi = ProfessionalProfileUpdateServicesApi();

  professionalUpdateProfile(ProfileUpdateModel profileUpdateModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await professionalProfileUpdateServicesApi.professionalProfileUpdate(profileUpdateModel);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      Get.off(ObordingProfotional());
      // Get.rawSnackbar(
      //   messageText: const Text(
      //     "Registered Successfully", 
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.green,
      // );
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

  //student profile update
  StudentProfileUpdateServicesApi studentProfileUpdateServicesApi = StudentProfileUpdateServicesApi();

  studentUpdateProfile(ProfileUpdateModel profileUpdateModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await studentProfileUpdateServicesApi.studentProfileUpdate(profileUpdateModel);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      Get.off(OnbordingStudent());
      // Get.rawSnackbar(
      //   messageText: const Text(
      //     "Registered Successfully",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.green,
      // );
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
      Get.find<ProfileController>().checkWhetherHeGo();
      // if (size < 600) {
      //   Get.offAllNamed('/home-screen');
      // } else {
      //   Get.offAllNamed(Routes.HOME_PAGE);
      // }

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
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Invalid User name / Password",
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

  GetStateApiServices getStateApiServices = GetStateApiServices();

  GetCityApiServices getCityApiServices = GetCityApiServices();

  getStateList() async {
    dio.Response<dynamic> response = await getStateApiServices.getStateApi();
    if (response.statusCode == 200) {
      StateListModel stateListModel = StateListModel.fromJson(response.data);
      stateList = stateListModel.stateList;
    }
    update();
  }

  getCityList(int stateId) async {
    dio.Response<dynamic> response =
        await getCityApiServices.getCityApi(stateId);
    if (response.statusCode == 200) {
      CityListModel cityListModel = CityListModel.fromJson(response.data);
      cityList = cityListModel.cityList;
    }
    update();
  }

  getRequiremetList() async {
    dio.Response<dynamic> response =
        await getRequirementsApiServices.getRequiremtsApi();
    if (response.statusCode == 200) {
      RequirementsModel requirementsModel =
          RequirementsModel.fromJson(response.data);
      requirementList = requirementsModel.requirement;
    }
    update();
  }

  GetSkillsServicesApi getSkillsServicesApi = GetSkillsServicesApi();

  getSkillsList() async {
    dio.Response<dynamic> response = await getSkillsServicesApi.getSkillsApi();

    if (response.statusCode == 200) {
      SkillsModel skillsdataModel = SkillsModel.fromJson(response.data);
      skillsDataList = skillsdataModel.data;
      update();
    }
  }

  List<SkillsData> skillsDataList = [];
}
