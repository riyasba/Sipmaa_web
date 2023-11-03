import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/models/get_education_skills_model.dart';
import 'package:reg_login/app/data/models/search_friends_model.dart';
import 'package:reg_login/app/data/services/profile_api_service/friend_request_api_services.dart';
import 'package:reg_login/app/data/services/profile_api_service/get_education_list_api_service.dart';
import 'package:reg_login/app/data/services/profile_api_service/respond_request_api_services.dart';
import 'package:reg_login/app/data/services/post_api_service/get_profile_api_services.dart';
import 'package:reg_login/app/data/services/profile_api_service/change_password_api_services.dart';
import 'package:reg_login/app/data/services/profile_api_service/search_user_api_services.dart';
import 'package:reg_login/app/data/services/profile_api_service/update_background_image_api_services.dart';
import 'package:reg_login/app/data/services/profile_api_service/update_userdetails_api_services.dart';
import 'package:reg_login/app/respohome/respohome.dart';
import 'package:reg_login/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simpa/models/friend_list_model.dart';
// import 'package:simpa/models/friend_request_model.dart';
// import 'package:simpa/models/notiofication_list_model.dart';
// import 'package:simpa/models/profile_model.dart';
// import 'package:simpa/models/search_friends_model.dart';
// import 'package:simpa/services/network_api_services/notification_list/notification_list.dart';
// import 'package:simpa/services/network_api_services/post_api_services/get_other_profile_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/get_profile_api_services.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/change_password_api_services.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/friend_request_api_services.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/my_friend_list_api_services.dart';
import 'package:dio/dio.dart' as dio;
// import 'package:simpa/services/network_api_services/profile_api_services/respond_request_api_services.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/search_user_api_services.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/send_friend_request.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/update_profile_pic.dart';
// import 'package:simpa/services/network_api_services/profile_api_services/update_userdetails_api_services.dart';
// import 'package:simpa/view/login/login_view/loginpage.dart';
// import 'package:simpa/view/profile_sccuessful_page.dart';

import '../../../modules/authentication/forgotPassword/views/conformpassword.dart';

import '../../../modules/authentication/forgotPassword/views/otp_forgot.dart';
import '../../../modules/authentication/forgotPassword/views/verified_screen.dart';
import '../../../respohome/resposetings/respo_settings.dart';
import '../../../responsive/forgotrespo/create_new_password.dart';
import '../../../responsive/forgotrespo/forgot_password_verifypage.dart';
import '../../../responsive/forgotrespo/sucessfull.dart';
import '../../../responsive/view/public_profle_view/setting_proifile_page.dart';
import '../../models/add_positions_model.dart';
import '../../models/friend_list_model.dart';
import '../../models/friend_request_model.dart';
import '../../models/notiofication_list_model.dart';
import '../../models/post_like_list_model.dart';
import '../../models/profile_model.dart';
import '../../services/notification_list/notification_list.dart';
import '../../services/post_api_service/get_other_profile_api_services.dart';
import '../../services/post_api_service/post_liked_list_api_services.dart';
import '../../services/profile_api_service/add_posotions_api_services.dart';
import '../../services/profile_api_service/add_skills_api_services.dart';
import '../../services/profile_api_service/forgetPwd_verify_otp_api_services.dart';
import '../../services/profile_api_service/forget_password_api_service.dart';
import '../../services/profile_api_service/my_friend_list_api_services.dart';
import '../../services/profile_api_service/resend_otp_api_service.dart';
import '../../services/profile_api_service/reset_password_api_service.dart';
import '../../services/profile_api_service/send_friend_request.dart';
import '../../services/profile_api_service/update_profile_pic.dart';

class ProfileController extends GetxController {
  GetFriendListApiServices getFriendListApiServices =
      GetFriendListApiServices();
  GetFriendRequestListApiServices getFriendRequestListApiServices =
      GetFriendRequestListApiServices();

  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  SearchFriendsApiServices searchFriendsApiServices =
      SearchFriendsApiServices();

  SendFriendRequestAPIServices sendFriendRequestAPIServices =
      SendFriendRequestAPIServices();
  PostLikesListApiServices postLikesListApiServices =
      PostLikesListApiServices();
  RespondFriendRequestAPIServices respondFriendRequestAPIServices =
      RespondFriendRequestAPIServices();

  ChangePasswordApiServices changePasswordApiServices =
      ChangePasswordApiServices();

  GetOtherProfileApiServices getOtherProfileApiServices =
      GetOtherProfileApiServices();
  AddPositonsApiServices addPositonsApiServices = AddPositonsApiServices();
  UpdateProfilePicApi updateProfilePicApi = UpdateProfilePicApi();

  UpdateUserDetailsApi updateUserDetailsApi = UpdateUserDetailsApi();

  GetNotificationListApi getNotificationLiistApi = GetNotificationListApi();
  AddSkillssApiServices addSkillssApiServices = AddSkillssApiServices();
  // RespondFriendRequestAPIServices respondFriendRequestAPIServices =
  //   RespondFriendRequestAPIServices();
  List<LikesList> likesList = [];
  List<FriendList> myFriendList = [];
  // List<FriendList> friendRequestList = [];
  List<FriendRequestList> friendRequestList = [];
  List<ProfileModel> profileData = [];
  List<ProfileModel> otherUserProfileData = [];
  List<SearchFriendsList> searchFriendsList = [];

  RxBool isLoading = false.obs;
  RxString educationlist = "".obs;
  
  getProfile() async {
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
     final prefs = await SharedPreferences.getInstance();
    profileData.clear();
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      await prefs.setString("user_id", profileModel.user.id.toString());
      profileData.add(profileModel);
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      Get.offAllNamed(Routes.SIGN_IN);
    }
    update();
  }

  checkWhetherHeGo() async {
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    profileData.clear();
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      profileData.add(profileModel);
      update();
      if (profileModel.positions.isEmpty || profileModel.skills.isEmpty) {
        Get.offAll(() => const RespSetings());
      } else {
        Get.offAll(MyHomePage());
      }
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }

  getOtherProfile({required String userid}) async {
    dio.Response<dynamic> response =
        await getOtherProfileApiServices.getOtherProfile(userId: userid);
    otherUserProfileData.clear();
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      otherUserProfileData.add(profileModel);
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      // Get.to(loginpage());
    }
    update();
  }

  getMyFriendList() async {
    dio.Response<dynamic> response =
        await getFriendListApiServices.getFriendListApiServices();

    if (response.statusCode == 200) {
      FriendListModel friendListModel = FriendListModel.fromJson(response.data);
      myFriendList = friendListModel.friendList;
      print(
          "---------<<<<<<<<<-------------------------------------------------------->>>>>>>>>>>>>>------------");
    }
    update();
  }

  getMyFriendRequestList() async {
    dio.Response<dynamic> response =
        await getFriendRequestListApiServices.getFriendRequestListApiServices();
    if (response.statusCode == 200) {
      FriendRequestListModel friendListModel =
          FriendRequestListModel.fromJson(response.data);
      friendRequestList = friendListModel.friendRequestList;
    }
    update();
  }

  searchUser(String keyWord) async {
    searchFriendsList.clear();
    dio.Response<dynamic> response =
        await searchFriendsApiServices.searchFriends(keyWord: keyWord);

    if (response.statusCode == 200) {
      SearchFriendsModel searchFriendsModel =
          SearchFriendsModel.fromJson(response.data);
      searchFriendsList = searchFriendsModel.friendList;
    }
    update();
  }

  sendRequest({required String userId, required int index}) async {
    dio.Response<dynamic> response =
        await sendFriendRequestAPIServices.sendFriendRequest(
            userId: userId, friendId: profileData.first.user.id.toString());

    print("--------------------------");
    print(response.data);

    if (response.statusCode == 200) {
      searchFriendsList[index].isFriend = true;
      update();
      Get.rawSnackbar(
        messageText: const Text(
          "Friend request sended",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Please try again",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  getLikesList({required String postId}) async {
    dio.Response<dynamic> response =
        await postLikesListApiServices.postLikesLists(postId: postId);

    if (response.statusCode == 201) {
      LikesListModel likesListModel = LikesListModel.fromJson(response.data);
      likesList = likesListModel.likesList;
    }
    update();
  }

  respondRequest({
    required String userId,
    required String status,
  }) async {
    dio.Response<dynamic> response =
        await respondFriendRequestAPIServices.respondFriendRequest(
            userId: userId,
            friendId: profileData.first.user.id.toString(),
            status: status);

    if (response.statusCode == 200) {
      getMyFriendRequestList();
      getMyFriendList();
      if (status == "1") {
        Get.rawSnackbar(
          messageText: const Text(
            "Request accepted",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        );
      } else if (status == "2") {
        Get.rawSnackbar(
          messageText: const Text(
            "Removed from request",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        );
      }
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Please try again",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  changePassword({
    required String oldPassword,
    required String currentPassword,
    required String condirmPassword,
  }) async {
    dio.Response<dynamic> response =
        await changePasswordApiServices.changePassword(
            oldPassword: oldPassword,
            currentPassword: currentPassword,
            condirmPassword: condirmPassword);

    if (response.statusCode == 200) {
      Get.back();
      Get.rawSnackbar(
        messageText: const Text(
          "password changed successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  // updateProfilePic({required File media}) async {
  //   isLoading(true);
  //   update();
  //   dio.Response<dynamic> response =
  //       await updateProfilePicApi.updateProfilePic(media: media);
  //   isLoading(false);
  //   update();
  //   if (response.statusCode == 200) {
  //     getProfile();
  //   }
  // }

  updateUserDetails({
    required String name,
    required String bio,
    required String lastName,
    dynamic hisOrHer,
    required String designation,
    required String email,
    required String mobile,
  }) async {
    isLoading(true);
    print("------------------->> working ------>>");
    update();
    dio.Response<dynamic> response =
        await updateUserDetailsApi.updateUserDetails(
            name: name,
            lastName: lastName,
            hisOrHer: hisOrHer,
            bio: bio,
            designation: designation,
            email: email,
            mobile: mobile);
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      // Get.to(ProfileSuccessfullPage());
      getProfile();
      Get.rawSnackbar(
        messageText: const Text(
          "Updated successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    }
  }

  List<ListElement> notificationList = [];
  RxInt notificationCount = 0.obs;

  getNotificationList() async {
    dio.Response<dynamic> response =
        await getNotificationLiistApi.getNotifionListApi();

    if (response.statusCode == 201) {
      NotificationListModel notificationListModel =
          NotificationListModel.fromJson(response.data);
      notificationList = notificationListModel.list;
      notificationCount(notificationListModel.count);
    }
    update();
  }

  // void updateProfilePic({required dynamic media}) {

  // }

  updateProfilePic({dynamic media}) async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await updateProfilePicApi.updateProfilePic(media: media);
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      getProfile();
    }
  }

  RxBool isBackgroundLoading = false.obs;

  UpdateProfileBackgroundPicApi updateProfileBackgroundPicApi =
      UpdateProfileBackgroundPicApi();

  updateProfileBackgoundPic({required dynamic media}) async {
    isBackgroundLoading(true);
    update();
    dio.Response<dynamic> response = await updateProfileBackgroundPicApi
        .updateProfileBackgroundPic(media: media);
    isBackgroundLoading(false);
    update();
    if (response.statusCode == 200) {
      getProfile();
    }
  }

  //verfify otp
  ForgetPwdVerifyOtpApiServices forgetPwdVerifyOtpApiServices =
      ForgetPwdVerifyOtpApiServices();

  verifyOtpfpwd({required String otp, required bool isFromMobile}) async {
    dio.Response<dynamic> response = await forgetPwdVerifyOtpApiServices
        .forgetPwdVerifyOtpApiServices(otp: otp);

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("mobile", response.data["data"].toString());
      if (isFromMobile) {
        Get.to(const CreateNewPassword());
      } else {
        Get.to(ConformPASSWORD());
      }
    } else if (response.statusCode == 404) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
        messageText: const Text(
          "The otp field is required.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
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

  ForgetPasswordApiServices forgetPasswordApiServices =
      ForgetPasswordApiServices();

  forgetPassword(
      {required String mobileoremail, required bool isFromMobile}) async {
    dio.Response<dynamic> response = await forgetPasswordApiServices
        .forgetPasswordApiServices(mobileoremail: mobileoremail);

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("data", response.data["data"].toString());

      if (isFromMobile) {
        Get.to(Forgotpasswordverifiypage(
          mobile: mobileoremail,
        ));
      } else {
        Get.to(OtpForgot(
          mobile: mobileoremail,
        ));
      }
    } else {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  //reset password
  ResetPwdApiServices resetPwdApiServices = ResetPwdApiServices();

  resetPassword(
      {required String password,
      required String confirmPassword,
      required bool isFromMobile}) async {
    dio.Response<dynamic> response =
        await resetPwdApiServices.resetPwdApiServices(
            password: password, confirmPassword: confirmPassword);

    if (response.statusCode == 200) {
      if (isFromMobile) {
        Get.to(const Sucessfullscreen());
      } else {
        Get.to(Verified());
      }
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
        messageText: const Text(
          "The password field confirmation does not match.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else if (response.statusCode == 404) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
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

  //resend otp
  ResendOtpApiServices resendOtpApiServices = ResendOtpApiServices();

  resendOtp({required String mobile}) async {
    dio.Response<dynamic> response =
        await resendOtpApiServices.resendOtpApiServices(mobile: mobile);

    if (response.statusCode == 200) {
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

  addPositions(
      {required AddPositonsModel addPostionsModel,
      required String useId}) async {
    isLoading(true);
    dio.Response<dynamic> response = await addPositonsApiServices.addPositions(
        addPostionsModel: addPostionsModel, useId: useId);
    isLoading(false);
    if (response.statusCode == 201) {
      getProfile();
      Get.offAll(() => RespSetings());
      Get.rawSnackbar(
        messageText: const Text(
          "Added new position",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Unable to add your position",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  addSkills({required String skills, required String useId}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addSkillssApiServices.addSkills(skills: skills, useId: useId);
    isLoading(false);
    if (response.statusCode == 201) {
      getProfile();
      Get.offAll(() => RespSetings());
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

  sendRequestFromProfile({required String userId}) async {
    bool isRequested = false;
    dio.Response<dynamic> response =
        await sendFriendRequestAPIServices.sendFriendRequest(
            userId: userId, friendId: profileData.first.user.id.toString());

    if (response.statusCode == 200) {
      isRequested = true;
      update();
      Get.rawSnackbar(
        messageText: const Text(
          "Friend request sended",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Please try again",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }

    return isRequested;
  }

  //get skill education list
  GetEducationalSkillsServicesApi getEducationskillApiServices =
      GetEducationalSkillsServicesApi();
  List<educationskillsdata> educationskillsData = [];

  getEducationalSkillsApi() async {
    dio.Response<dynamic> response =
        await getEducationskillApiServices.getEducationalSkillsApi();
    if (response.statusCode == 200) {
      
      GetEducationalSkillsModel educationSkillsListModel = GetEducationalSkillsModel.fromJson(response.data); 
            educationskillsData = educationSkillsListModel.departments;
            update();
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
    update();
  }

}


