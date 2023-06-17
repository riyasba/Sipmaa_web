import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/responsive/respologin.dart';
import 'package:reg_login/app/responsive/view/home_responsive_view.dart';

import '../../../../responsive/loginrespo/logininscreensrespo.dart';

class Registersplash extends StatefulWidget {
  const Registersplash({super.key});

  @override
  State<Registersplash> createState() => _RegistersplashState();
}

class _RegistersplashState extends State<Registersplash> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 3));

   Get.offAll(()=> LoginRespoView());
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
            SizedBox(
              height: 30,
            ),
            Text(
              'The Registration Request has been Sent',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              'Sent to modern Community',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
