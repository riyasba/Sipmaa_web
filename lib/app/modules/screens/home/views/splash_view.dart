import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkForAuth();
  }

  toHomePage() async {
    await Future.delayed(const Duration(milliseconds: 3900));

    Get.offAllNamed(Routes.HOME_PAGE);
  }

  toLoginPage() async {
    await Future.delayed(const Duration(milliseconds: 3900));

    Get.offAllNamed(Routes.SIGN_IN);
  }

  toregisterDetailsPage() async {
    await Future.delayed(const Duration(milliseconds: 3900));
    Get.offAllNamed(Routes.responsive_registerDetails);
  }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    String? verify = prefs.getString("verify");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      toLoginPage();
    } else {
      print("---------inside login---------");
      if (verify == "true") {
        toHomePage();
      } else {
        print("---------verify false---------");
        toregisterDetailsPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
