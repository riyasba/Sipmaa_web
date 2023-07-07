import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../data/models/widgets/textfield.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final profileController = Get.find<ProfileController>();

  var mobileOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title:const Text(
          'Forget Password',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ksizedbox10,Image.asset('assets/images/WhatsApp Image 2023-07-05 at 19.03.11.jpg'),
          //  kforgotImage,ic
            ksizedbox30,
            const Text(
              'Please Enter Your Email Address or',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const Text(
              'Mobile Number to Receive a Verification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            ksizedbox30,
            ksizedbox30,
            const Text('Enter Email Address or Mobile Number',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            TextformfieldWidget(
              controller: mobileOrEmailController,
              text: 'Enter Email Address or Mobile Number',
              textt: "",
            ),
            ksizedbox30,
            ksizedbox30,
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
                    profileController.forgetPassword(mobileoremail: mobileOrEmailController.text,isFromMobile: true);
                    // Get.to(const Forgotpasswordverifiypage());
                  },
                  child:const Text(
                    'Sent it',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
       ksizedbox30,   ],
        ),
      ),
    );
  }
}
