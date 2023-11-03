import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/controllers/profile_controller.dart';

class WebOtpScreen extends StatefulWidget {
  String otp;
  String phoneNumber;
  WebOtpScreen({super.key,required this.phoneNumber,required this.otp});

  @override
  State<WebOtpScreen> createState() => _WebOtpScreenState();
}

class _WebOtpScreenState extends State<WebOtpScreen> {
final profileController = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();

  String otpValue = "";
   int _start = 60; // Timer duration in seconds
  bool _isActive = false;
  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 1) {
          _isActive = false;
          timer.cancel();
          _start = 60;
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
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
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'OTP Verification mob',
                          style: ktextstyle22,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Enter the OTP sent to',
                          style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.phoneNumber,
                          style:const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                        // Text(
                        //   widget.otp,
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w400,
                        //       color: Colors.black),
                        // ),
                        ksizedbox10,
                        ksizedbox10,
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor:const Color(0xFF512DA8),
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
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         const Text("Don't receive it ?",style: TextStyle(color: Colors.grey),),
                          _isActive
                        ? Text(
                            "Resend in $_start",
                            style:const TextStyle(color: Colors.blue),
                          )
                        : InkWell(
                            onTap: () async {
                              profileController.resendOtp(mobile: widget.phoneNumber);
                              setState(() {
                                _isActive = true;
                               // widget.otp = tempOtp;
                              });
                              startTimer();
                            },
                            child:const Text(
                              "Resend",
                              style: TextStyle(
                                  color: Colors.blue),
                            ),
                          ),
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
                                  backgroundColor:const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                   print(otpValue);
                                  authController.registerOtpVerify(otpValue, true);
                                  //authController.otpVerify(otpValue,true);
                                },
                                //=> Get.toNamed('/register-2'),
                                child:const Text(
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
