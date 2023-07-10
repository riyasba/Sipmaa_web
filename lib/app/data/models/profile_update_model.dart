// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);



class ProfileUpdateModel {
  String currentCompany;
  String designation;
  String department;
  String officialEmail;
  String industries;
  String address;
  String pincode;
  String city;
  String state;

  ProfileUpdateModel({
    required this.currentCompany,
    required this.designation,
    required this.department,
    required this.officialEmail,
     required this.industries,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
  });
}
