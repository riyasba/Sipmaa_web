import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/modules/authentication/forgotPassword/views/otp_forgot.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/constands/formfield.dart';
import '../../../../data/components/controllers/profile_controller.dart';
import '../../../../responsive/widgets/phone_number_text_field.dart';
import '../../../../responsive/widgets/textfield.dart';
import 'conformpassword.dart';

class FORGOTPASSWORD extends StatefulWidget {
  const FORGOTPASSWORD({super.key});

  @override
  State<FORGOTPASSWORD> createState() => _FORGOTPASSWORDState();
}

class _FORGOTPASSWORDState extends State<FORGOTPASSWORD> {
  final profileController = Get.find<ProfileController>();

  var mobileOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45, bottom: 20, top: 30),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    //  color: kwhite,
                    //height: double.infinity,
                    // width: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ksizedbox10,
                        Image.asset(
                          'assets/images/logo (3).png',
                          height: 150,
                        ),
                        ksizedbox10,
                        //     kforgotImage,
                        Text(
                          'FORGET PASSWORD',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        ksizedbox30,
                        Text(
                          'Please Enter Your Email Address or',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kgrey,
                              fontSize: 18),
                        ),
                        Text(
                          'Mobile Number to Receive a Verification',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kgrey,
                              fontSize: 18),
                        ),
                        ksizedbox30,

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextformfieldWidget(
              controller: mobileOrEmailController,
              text: 'Enter Email Address or Mobile Number',
              textt: "Enter Email Address or Mobile Number",
            ),
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
                                Get.to(profileController.forgetPassword(
                                    mobileoremail:
                                        mobileOrEmailController.text,isFromMobile: false));

                                //     Get.off(registerpage());
                              },
                              child: Text(
                                'Sent It',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        child: Image.asset('assets/images/Asset 11 4.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
