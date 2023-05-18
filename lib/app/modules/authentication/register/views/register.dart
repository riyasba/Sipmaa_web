import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../constands/constands.dart';
import '../../../../../constands/formfield.dart';

class Resgister2 extends StatelessWidget {
  const Resgister2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                 // height:1200,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 37,right: 37,top: 40,bottom: 40),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/logo (3).png',
                      ),
                      ksizedbox10,
                      Text(
                        'Enter the below Details',
                        style: ktextstyle22,
                      ),
                      
                      ksizedbox10,
                                   
                     
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text('  Professional Qualification'),
                      //       ksizedbox10,
                      //       DropDownField(
                      //         items: _options,
                      //         hintText: ' Select Qualification',
                      //         onValueChanged: (value) {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                     
                      TextformfieldWidget(
                          text: 'Current Company',
                          textt: 'Current Company'),
                      TextformfieldWidget(text: 'Enter Designation', textt: 'Designation'),
                      TextformfieldWidget(text: 'Enter Official Email ID', textt: 'Official Email ID'),
                      TextformfieldWidget(text: 'Enter Location', textt: 'Location'),
                      TextformfieldWidget(text: 'Type City', textt: 'City'),
                      TextformfieldWidget(text: 'Type State', textt: 'State'),
                      TextformfieldWidget(text: 'Postal Code', textt: 'Postal Code'),
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
                              onPressed: () =>Get.toNamed('/resgister-splash'),
                               
                              
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}