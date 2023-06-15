import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/auth_controllers.dart';


class otp_page extends StatefulWidget {
  String phoneNumber;
  String otp;
  otp_page({super.key, required this.phoneNumber, required this.otp});

  @override
  State<otp_page> createState() => _otp_pageState();
}

class _otp_pageState extends State<otp_page> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  String otpValue = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 37, right: 37, top: 40, bottom: 40),
                child: Center(
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ]),
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'OTP Verification',
                        style: ktextstyle22,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Enter the OTP sent to',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      ),
                      Text(
                        "OTP is -  ${widget.otp}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      ksizedbox10,
                      ksizedbox10,
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          setState(() {
                            otpValue = verificationCode;
                          });
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: const Text("Verification Code"),
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
                          const Text("Dont't you receive the OTP?"),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                      Obx(
                        () => SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: authController.isLoading.isTrue
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                        0xFF3C73B1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      // authController.otpVerify(widget.otp);
                                    },
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                        0xFF3C73B1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      print(otpValue);
                                      authController.otpVerify(otpValue,false);
                                    },
                                    child: const Text(
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
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
