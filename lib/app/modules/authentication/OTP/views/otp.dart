import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';

import '../../../../data/components/constands/constands.dart';

class OTPVIEWS extends StatefulWidget {
  String phoneNumber;
  String otp;
  OTPVIEWS({super.key, required this.phoneNumber, required this.otp});

  @override
  State<OTPVIEWS> createState() => _OTPVIEWSState();
}

class _OTPVIEWSState extends State<OTPVIEWS> {

  final authController = Get.find<AuthController>();

  String otpValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kblue,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    //    height: 400,
                    //  width: 500,
        
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'OTP Verification',
                          style: ktextstyle22,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Enter the OTP sent to',
                          style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.phoneNumber,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                        Text(
                          widget.otp,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        ksizedbox10,
                        ksizedbox10,
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                             otpValue = verificationCode;
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text("Verification Code"),
                            //         content:
                            //             Text('Code entered is $verificationCode'),
                            //       );
                            //     });
                          }, // end onSubmit
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont't you receive the OTP?"),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Resend OTP',
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                        Container(width: 500,
                          child: SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  authController.otpVerify(otpValue);
                                },
                                //=> Get.toNamed('/register-2'),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ksizedbox10,
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container(child: Image.asset('assets/images/Group 85.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
