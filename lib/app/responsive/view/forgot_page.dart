import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';


import '../../data/components/constands/constands.dart';
import '../../data/models/widgets/textfield.dart';
import 'forgot_password_verifypage.dart';

class forgot extends StatelessWidget {
  const forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title: Text(
          'Forgot Password ?',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ksizedbox10,
           // kforgotImage,
            ksizedbox30,
            Text(
              'Please Enter Your Email Addreass or',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(
              'Mobile Number to Receive a Verification',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            ksizedbox30,
            Text('Enter Email Addreass or Mobile Number',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            TextformfieldWidget(
              text: 'Enter Email Addreass or Mobile Number',
              textt: "",
            ),
            ksizedbox30,
            SizedBox(
              height: 45,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                      0xFF3C73B1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Get.off(forgotpasswordverifiypage());
                  },
                  child: Text(
                    'Sent It',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
