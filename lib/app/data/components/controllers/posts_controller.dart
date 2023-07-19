import 'dart:io';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/responsive/respologin.dart';
import 'package:reg_login/app/data/services/post_api_service/post_liked_list_api_services.dart';
import 'package:reg_login/app/data/models/search_post_model.dart';
import 'package:reg_login/app/data/services/post_api_service/search_post_api_services.dart';
import 'package:reg_login/app/data/services/post_api_service/upload_post_api_services.dart';
import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simpa/controllers/auth_controllers.dart';
// import 'package:simpa/models/comment_list_model.dart';
// import 'package:simpa/models/get_all_post_modals.dart';
// import 'package:simpa/models/post_like_list_model.dart';
// import 'package:simpa/models/profile_model.dart';
// import 'package:simpa/models/search_post_modal.dart';
// import 'package:simpa/models/search_post_modals.dart';
// import 'package:simpa/services/network_api_services/post_api_services/filter_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/get_all_post_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/get_profile_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/post_comment_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/post_comment_list_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/post_delete_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/post_like_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/post_liked_list_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/search_post_api_services.dart';
// import 'package:simpa/services/network_api_services/post_api_services/upload_post_api_services.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/comment_list_model.dart';
import '../../models/get_all_post_modals.dart';
import '../../models/post_like_list_model.dart';
import '../../models/profile_model.dart';
import '../../services/post_api_service/filter_api_services.dart';
import '../../services/post_api_service/get_all_post_api_services.dart';
import '../../services/post_api_service/get_profile_api_services.dart';
import '../../services/post_api_service/post_comment_api_services.dart';
import '../../services/post_api_service/post_comment_list_api_services.dart';
import '../../services/post_api_service/post_delete_api_services.dart';
import '../../services/post_api_service/post_like_api_services.dart';
import '../../services/post_api_service/report_a_post_api_services.dart';

// import 'package:simpa/view/login/login_view/loginpage.dart';
// import 'package:simpa/view/post_splash.dart';
// import 'package:simpa/widgets/bottumnavigationbar.dart';

class PostsController extends GetxController {
  RxBool isLoading = false.obs;

  GetAllPostApiServices getAllPostApiServices = GetAllPostApiServices();
  SearchPostApiServices searchPostApiServices = SearchPostApiServices();
  UploadPostApiServices uploadPostApiServices = UploadPostApiServices();
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  PostLikeApiServices postLikeApiServices = PostLikeApiServices();
  PostCommentsListApiServices postCommentsListApiServices =
      PostCommentsListApiServices();
  PostCommentsApiServices postCommentsApiServices = PostCommentsApiServices();
  PostLikesListApiServices postLikesListApiServices =
      PostLikesListApiServices();
  PostFilterApiServices postFilterApiServices = PostFilterApiServices();
  ReportAPostApiServices reportAPostApiServices = ReportAPostApiServices();
  PostDelteApiServices postDelteApiServices = PostDelteApiServices();

  List<Post> allPostList = [];
  List<Post> filterList = [];
//  List<SearchPost> searchPosts = [];
  // List<Post> filterList = [];
  List<SearchPost> searchPosts = [];
  List<User> profileData = [];
  List<LikesList> likesList = [];
  List<CommentsList> commentsList = [];

  getProfile() async {
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    profileData.clear();
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      //  var token = await FirebaseMessaging.instance.getToken();
      //Get.find<AuthController>().fcmtoken(
      //    token: token.toString(), id: profileModel.user.id.toString());
      //  print("............firebase token.......=====================>>>");
      //print(token);
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", "null");
      // Get.to(loginpage());
    }
    update();
  }

  getAllPost() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await getAllPostApiServices.getAllPostApiServices();
    isLoading(false);
    update();
    if (response.statusCode == 200) {
      GetAllPostModel getAllPostModel = GetAllPostModel.fromJson(response.data);
      allPostList = getAllPostModel.posts;
    }
    update();
  }

  getAllInFilterPost() async {
    dio.Response<dynamic> response =
        await getAllPostApiServices.getAllPostApiServices();

    if (response.statusCode == 200) {
      GetAllPostModel getAllPostModel = GetAllPostModel.fromJson(response.data);
      filterList = getAllPostModel.posts;
    }
    update();
  }

  filterPosts({required int departmentId}) async {
    dio.Response<dynamic> response = await postFilterApiServices.postFilter(
        departmentId: departmentId.toString());

    if (response.statusCode == 200) {
      GetAllPostModel getAllPostModel = GetAllPostModel.fromJson(response.data);
      filterList = getAllPostModel.posts;
    }
    update();
  }

  postLike(
      {required String postId,
      required String isLiked,
      required int index}) async {
    dio.Response<dynamic> response =
        await postLikeApiServices.postLike(postId: postId, isLiked: isLiked);

    if (response.statusCode == 201) {
      if (isLiked == "1") {
        allPostList[index].likeCount = allPostList[index].likeCount + 1;
        allPostList[index].likedByUser = true;
      } else {
        allPostList[index].likeCount = allPostList[index].likeCount - 1;
        allPostList[index].likedByUser = false;
      }
    }
    update();
  }

  postFilrertLike(
      {required String postId,
      required String isLiked,
      required int index}) async {
    dio.Response<dynamic> response =
        await postLikeApiServices.postLike(postId: postId, isLiked: isLiked);

    if (response.statusCode == 201) {
      if (isLiked == "1") {
        filterList[index].likeCount = filterList[index].likeCount + 1;
        filterList[index].likedByUser = true;
      } else {
        filterList[index].likeCount = filterList[index].likeCount - 1;
        filterList[index].likedByUser = false;
      }
    }
    update();
  }

  searchPost({required String keyWord}) async {
    dio.Response<dynamic> response =
        await searchPostApiServices.searchPost(keyWord: keyWord);

    if (response.statusCode == 200) {
      SearchPostModal searchPostsModel =
          SearchPostModal.fromJson(response.data);
      searchPosts = searchPostsModel.posts;
    }
    update();
  }

  uplodPost({
    required String title,
    required String description,
    required var media,
  }) async {
    isLoading(true);
    update();
    dio.Response<dynamic> response = await uploadPostApiServices.uploadPost(
        title: title, description: description, media: media);
    isLoading(false);

    if (response.statusCode == 201) {
      // Get.off(HomePage());
      // Get.rawSnackbar(
      //   messageText: const Text(
      //     "Uploaded successfull",
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

    return response.statusCode;
  }

  postComments({
    required String userID,
    required String postId,
    required String comment,
    required int index,
  }) async {
    dio.Response<dynamic> response = await postCommentsApiServices.postComments(
        userID: userID, postId: postId, comment: comment);

    if (response.statusCode == 200) {
      getComments(postId: postId);
      int commentCount = Get.find<PostsController>().allPostList[index].comment;
      Get.find<PostsController>().allPostList[index].comment = commentCount + 1;
      Get.find<PostsController>().update();
      Get.rawSnackbar(
        messageText: const Text(
          "Comment posted",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Could't post comments now",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  getComments({required String postId}) async {
    dio.Response<dynamic> response =
        await postCommentsListApiServices.postCommentLists(postId: postId);

    if (response.statusCode == 201) {
      CommentsListModel commentsListModel =
          CommentsListModel.fromJson(response.data);
      commentsList = commentsListModel.commentsList;
    }
    update();
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

  deletePost({required String postId}) async {
    dio.Response<dynamic> response =
        await postDelteApiServices.postDelete(postID: postId);
    if (response.statusCode == 200) {
      //  getProfile();
      getAllPost();
      Get.find<ProfileController>().getProfile();
      Get.back();
      Get.back();
      Get.rawSnackbar(
        messageText: const Text(
          "Post deleted",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      );
    }
  }

  reportAPost({
    required String userId,
    required String postId,
    required String comment,
  }) async {
    dio.Response<dynamic> response =
        await reportAPostApiServices.reportAPostApiServices(
            userId: userId, postId: postId, comment: comment);

    if (response.statusCode == 200) {
      Get.rawSnackbar(
          messageText: Text(
            "Thank you for your report. We will look into it and get back to you",
            style: primaryfont.copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.black);
    }
  }

  Future<String> getLikedNames({required String postId}) async {
    String name = "";
    dio.Response<dynamic> response =
        await postLikesListApiServices.postLikesLists(postId: postId);

    if (response.statusCode == 201) {
      LikesListModel likesListModel = LikesListModel.fromJson(response.data);
      likesList = likesListModel.likesList;
      name = likesList.first.userName;
      print(likesList.first.userName);
      print(name);
    }
    return name;
  }
}
