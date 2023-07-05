import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/modules/authentication/forgotPassword/views/verified_screen.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/controllers/profile_controller.dart';
import '../../../../data/models/widgets/password_text_field.dart';
import '../../../../data/models/widgets/textfield.dart';

class ConformPASSWORD extends StatefulWidget {
  const ConformPASSWORD({super.key});

  @override
  State<ConformPASSWORD> createState() => _ConformPASSWORDState();
}

class _ConformPASSWORDState extends State<ConformPASSWORD> {

 final profileController = Get.find<ProfileController>();
  String otpValue = "";
   var passwordController = TextEditingController();
   var confirmpasswordController = TextEditingController();
   final textFieldFocusNode = FocusNode();
   final textFieldFocusNode1 = FocusNode();

  bool _obscured = false;
   bool _obscured1 = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured1 = !_obscured1;
      if (textFieldFocusNode1.hasPrimaryFocus) return;
      textFieldFocusNode1.canRequestFocus = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
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
                        Image.asset(
                          'assets/images/logo (3).png',
                          height: 150,
                        ),
                        ksizedbox10,
                        //     kforgotImage,
                        Text(
                          'Create New Password',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        ksizedbox30,

                        // Text(
                        //   'Mobile Number to Receive a Verification',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w600, fontSize: 18),
                        // ),

                        PassWordTextformfieldWidget(
                               controller:  passwordController,
                            validationText: "Create Password can't be empty",
                            text: 'Enter New Password',
                            textt: 'Enter New Password'),
                        // TextformfieldWidget(
                        //     text: 'Enter Email Id', textt: 'Email Id'),
                        PassWordTextformfieldWidget(
                              controller: confirmpasswordController,
                            validationText: "Conform Password can't be empty",
                            text: 'Enter Confirm Password',
                            textt: 'Enter Confirm Password'),

                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: TextformfieldWidget(
                        //     text: 'New Password',
                        //     textt: "Enter New Password",
                        //   ),
                        // ),ksizedbox10,    Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: TextformfieldWidget(
                        //     text: 'Enter Conform Password',
                        //     textt: "Conform Password",
                        //   ),
                        // ),
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
                              onPressed: () {    profileController.resetPassword(
                      password: passwordController.text,
                      confirmPassword: confirmpasswordController.text, isFromMobile: false);
                            //    Get.to(Verified());
                                //     Get.off(registerpage());
                              },
                              child: Text(
                                'Done',
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
                        child: Image.asset('assets/images/Group 92.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
