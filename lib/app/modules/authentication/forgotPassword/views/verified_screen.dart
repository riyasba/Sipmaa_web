import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/modules/authentication/forgotPassword/views/otp_forgot.dart';
import 'package:reg_login/app/modules/authentication/signin/views/signin.dart';

class Verified extends StatelessWidget {
  const Verified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(8)), //  color: kwhite,
            //height: double.infinity,
            // width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ksizedbox10,
                Image.asset(
                  'assets/images/ad.png',
                  height: 250,
                ),
                Text(
                  'Your Password has been',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text('Changed successfuly',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ksizedbox20,
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
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
                        Get.to(SignInView());
                        //     Get.off(registerpage());
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ksizedbox20
              ],
            )),
      ),
    );
  }
}
