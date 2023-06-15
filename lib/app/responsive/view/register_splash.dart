import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../respologin.dart';
import '../widgets/bottumnavigationbar.dart';


class registersplash extends StatefulWidget {
  const registersplash({super.key});

  @override
  State<registersplash> createState() => _registersplashState();
}

class _registersplashState extends State<registersplash> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", "null");
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() =>  loginpagerespo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Group 97.png',
              height: 350,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'The Registratin Request has been Sent',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Sent to modern Community',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
