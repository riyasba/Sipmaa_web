import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';

import '../../data/components/constands/constands.dart';
import '../widgets/bottumnavigationbar.dart';

class Forgotpasswordverifiypage extends StatefulWidget {
  const Forgotpasswordverifiypage({super.key});

  @override
  State<Forgotpasswordverifiypage> createState() =>
      _ForgotpasswordverifiypageState();
}

class _ForgotpasswordverifiypageState extends State<Forgotpasswordverifiypage> {

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    //toHomePage();
  }

   String otpValue = "";

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        // title:const Text(
        //   'Forget Password',
        //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Image.asset('assets/images/WhatsApp Image 2023-07-05 at 19.03.11.jpg'),
               // kverifiyforgotimage,
                Text(
                  'Create New Password',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 5,),
                Text(
                  'OTP has been send to your registered email Id',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 30),
                 // child: Center(child: kverifiyforgotimage),
                ),
                Text(
                  'Enter OTP',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                ksizedbox10,
                OtpTextField(
                        numberOfFields: 4,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: false,
                        fieldWidth: 75,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                           setState(() {
                            otpValue = code;
                          });
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
                       Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't receive it ?",style: TextStyle(color: Colors.grey),),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Resend',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
              ],
            ),
            ksizedbox30,
            Column(
              children: [
                SizedBox(
              height: 45,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
                    print("---------------------Entered in ${otpValue}");
                    profileController.verifyOtpfpwd(otp: otpValue);
                  //  Get.to(const CreateNewPassword());
                  },
                  child:const Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
