import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../constands/constands.dart';
import '../../../../../constands/formfield.dart';

class REGISTERVIEWS extends StatelessWidget {
  const REGISTERVIEWS({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
                decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:  [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 37, right: 37, top: 40, bottom: 40),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/logo (3).png',
                        ),
                      ),
                      ksizedbox10,
                      Text(
                        'Welcome to SIPMAA',
                        style: ktextstyle22,
                      ),
                      Text(
                        'HR community',
                        style: ktextstyle,
                      ),
                      ksizedbox10,
                      TextformfieldWidget(text: 'First Name', textt: 'First Name'),
                      TextformfieldWidget(text: 'Last Name', textt: 'Last Name'),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "User Name",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFormField(
                                  //  controller: controller,
                                  // validator: validator,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    fillColor: Colors.white,
                                    labelText: 'User Name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(0, 158, 158, 158),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(17.0, 8.0, 17.0, 7.0),
                                  ),
                                ),
                                Text(
                                  'Not Availabe',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Email ID",
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFormField(
                                  //  controller: controller,
                                  // validator: validator,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    fillColor: Colors.white,
                                    labelText: 'Email Id',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(0, 158, 158, 158),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(17.0, 8.0, 17.0, 7.0),
                                  ),
                                ),
                                Text(
                                  'Availabe',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // TextformfieldWidget(
                      //   text: 'User Name',
                      //   textt: "User Name",
                      // ),
                      TextformfieldWidget(
                          text: 'Phone Number', textt: 'Phone Number'),
                      TextformfieldWidget(
                          text: 'Create Password', textt: 'Create Password'),
                      // TextformfieldWidget(
                      //     text: 'Enter Email Id', textt: 'Email Id'),
                      TextformfieldWidget(
                          text: 'Conform Password', textt: 'Conform Password'),
                      ksizedbox10,
                      ksizedbox10,
                      ksizedbox10,
                      SizedBox(
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
                              onPressed: () =>Get.toNamed('/otp-views'),
                               // Get.off(otp_page());
                              
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      ksizedbox10,
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}