import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/modules/authentication/signin/views/signin.dart';
import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';
import 'package:reg_login/app/responsive/responsive_homescreen.dart';
import 'package:reg_login/app/responsive/view/home_responsive_view.dart';
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

    Get.offAll(
      () => HomeRespoView(),
    );
  }

  toLoginPage() async {
    await Future.delayed(const Duration(milliseconds: 3900));

    Get.offAll(
      () => HomeView(),
    );
  }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      toLoginPage();
    } else {
      toHomePage();
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
