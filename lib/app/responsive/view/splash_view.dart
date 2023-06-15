// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simpa/view/login/login_view/loginpage.dart';
// import 'package:simpa/view/register_details_page.dart';
// import 'package:simpa/widgets/bottumnavigationbar.dart';

// class splash extends StatefulWidget {
//   const splash({super.key});

//   @override
//   State<splash> createState() => _splashState();
// }

// class _splashState extends State<splash> {
//   @override
//   void initState() {
//     super.initState();
//     checkForAuth();
//   }

//   toHomePage() async {
//     await Future.delayed(const Duration(milliseconds: 3900));

//     Get.offAll(
//       () => BottomNavigationBarExample(),
//     );
//   }

//   toLoginPage() async {
//     await Future.delayed(const Duration(milliseconds: 3900));

//     Get.offAll(
//       () => loginpage(),
//     );
//   }

//   toregisterDetailsPage() async {
//     await Future.delayed(const Duration(milliseconds: 3900));
//     Get.offAll(
//       () => RegisterDetailsView(),
//     );
//   }

//   checkForAuth() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? authtoken = prefs.getString("auth_token");
//     String? verify = prefs.getString("verify");
//     print("Token is here");
//     print(authtoken);
//     if (authtoken == "null" || authtoken == null) {
//       toLoginPage();
//     } else {
//       print("---------inside login---------");
//       if (verify == "true") {
//         toHomePage();
//       } else {
//         print("---------verify false---------");
//         toregisterDetailsPage();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           child: Image.asset('assets/images/iPhone 14 Pro Max – 1.gif'),
//         ),
//       ),
//     );
//   }
// }
