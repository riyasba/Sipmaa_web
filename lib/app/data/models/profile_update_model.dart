// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);

import 'dart:convert';

class ProfileUpdateModel {
  String currentCompany;
  String designation;
  String department;
  String officialEmail;
  String address;
  String pincode;
  String city;
  String state;

  ProfileUpdateModel({
    required this.currentCompany,
    required this.designation,
    required this.department,
    required this.officialEmail,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
  });
}
