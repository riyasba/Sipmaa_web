import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/responsive/respologin.dart';


class Sucessfullscreen extends StatefulWidget {
  const Sucessfullscreen({super.key});

  @override
  State<Sucessfullscreen> createState() => _SucessfullscreenState();
}

class _SucessfullscreenState extends State<Sucessfullscreen> {

  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() =>loginpagerespo() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/WhatsApp Image 2023-07-05 at 19.03.10.jpg')
      ),
    );
  }
}