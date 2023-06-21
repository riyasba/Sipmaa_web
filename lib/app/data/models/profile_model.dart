// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';



import 'get_all_post_modals.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  User user;
  List<Post> posts;
  int totalFriends;
  int isFriend;
  int totalLikes;
  int totalPosts;

  ProfileModel({
    required this.message,
    required this.user,
    required this.posts,
    required this.totalFriends,
    required this.isFriend,
    required this.totalLikes,
    required this.totalPosts,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        totalFriends: json["total_friends"],
        isFriend: json["is_friend"],
        totalLikes: json["total_likes"],
        totalPosts: json["total_posts"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "total_friends": totalFriends,
        "is_friend": isFriend,
        "total_likes": totalLikes,
        "total_posts": totalPosts,
      };
}


class User {
  int id;
  dynamic roleId;
  String name;
  String email;
  String mobile;
  dynamic isVerrifiedMobile;
  String lastName;
  String userName;
  dynamic otp;
  dynamic currentCompany;
  dynamic department;
  dynamic designation;
  dynamic qualification;
  dynamic officialEmail;
  dynamic profilePicture;
  dynamic clientSecret;
  dynamic clientId;
  dynamic keyName;
  dynamic keyStatus;
  dynamic emailVerifiedAt;
  dynamic address;
  dynamic bio;
  dynamic pincode;
  dynamic city;
  dynamic state;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.isVerrifiedMobile,
    required this.lastName,
    required this.userName,
    required this.otp,
    this.currentCompany,
    required this.department,
    this.designation,
    this.qualification,
    this.officialEmail,
    this.profilePicture,
    this.clientSecret,
    this.clientId,
    this.keyName,
    required this.keyStatus,
    this.emailVerifiedAt,
    this.address,
    this.bio,
    this.pincode,
    this.city,
    this.state,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        isVerrifiedMobile: json["is_verrified_mobile"],
        lastName: json["last_name"] ?? "",
        userName: json["user_name"],
        otp: json["otp"],
        currentCompany: json["current_company"],
        department: json["department"],
        designation: json["designation"],
        qualification: json["qualification"],
        officialEmail: json["official_email"],
        profilePicture: json["profile_picture"],
        clientSecret: json["client_secret"],
        clientId: json["client_id"],
        keyName: json["Key_name"],
        keyStatus: json["Key_status"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        bio: json["bio"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "is_verrified_mobile": isVerrifiedMobile,
        "last_name": lastName,
        "user_name": userName,
        "otp": otp,
        "current_company": currentCompany,
        "department": department,
        "designation": designation,
        "qualification": qualification,
        "official_email": officialEmail,
        "profile_picture": profilePicture,
        "client_secret": clientSecret,
        "client_id": clientId,
        "Key_name": keyName,
        "Key_status": keyStatus,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "bio": bio,
        "pincode": pincode,
        "city": city,
        "state": state,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
