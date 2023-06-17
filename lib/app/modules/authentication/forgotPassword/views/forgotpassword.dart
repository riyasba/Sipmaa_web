import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/constands/formfield.dart';
import '../../../../responsive/widgets/textfield.dart';

class FORGOTPASSWORD extends StatelessWidget {
  const FORGOTPASSWORD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Container(decoration: BoxDecoration(color: kwhite,borderRadius: BorderRadius.circular(6)),
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
                        //     kforgotImage,
                        Text(
                          'FORGET PASSWORD',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        ksizedbox30,
                        Text(
                          'Please Enter Your Email Addreass or',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text(
                          'Mobile Number to Receive a Verification',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        ksizedbox30,
                        Text('Enter Email Addreass or Mobile Number',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextformfieldWidget(
                            text: 'Enter Email Addreass or Mobile Number',
                            textt: "",
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
