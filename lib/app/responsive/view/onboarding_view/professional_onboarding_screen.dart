import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';

class ObordingProfotional extends StatefulWidget {
  ObordingProfotional({super.key});

  @override
  State<ObordingProfotional> createState() => _ObordingProfotionalState();
}

class _ObordingProfotionalState extends State<ObordingProfotional> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      // appBar: AppBar(
      //   backgroundColor: kwhite,
      //   elevation: 0,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child: Container(
              width: 400,
              decoration: BoxDecoration(
                 color: kwhite,
                 borderRadius: BorderRadius.circular(16)
              ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Professional',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  ksizedbox30,
                  ksizedbox30,
                  const Text(
                    'Would you like to be a  _________________',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  ksizedbox40,
                  ksizedbox30,
                  Obx(
                    () => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            authController.professinalindex(0);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: kgrey),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // kwidth10,
                                  const Text(
                                    'Mentor',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  authController.professinalindex.value == 0
                                      ? Icon(
                                          Icons.check_circle,
                                          color: kblue,
                                          size: 30,
                                        )
                                      : Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: kgrey,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        )
                                  //   kwidth10
                                ],
                              ),
                            ),
                          ),
                        ),
                        ksizedbox30,
                        InkWell(
                          onTap: () {
                            authController.professinalindex(1);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: kgrey),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // kwidth10,
                                  const Text(
                                    'Trainer',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
          
                                  authController.professinalindex.value == 1
                                      ? Icon(
                                          Icons.check_circle,
                                          color: kblue,
                                          size: 30,
                                        )
                                      : Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: kgrey,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        )
                                  //   kwidth10
                                ],
                              ),
                            ),
                          ),
                        ),
                        ksizedbox30,
                        InkWell(
                          onTap: () {
                            authController.professinalindex(2);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: kgrey),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // kwidth10,
                                  const Text(
                                    'Guide',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  authController.professinalindex.value == 2
                                      ? Icon(
                                          Icons.check_circle,
                                          color: kblue,
                                          size: 30,
                                        )
                                      : Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: kgrey,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        )
                                  //   kwidth10
                                ],
                              ),
                            ),
                          ),
                        ), 
                      ],
                    ),
                  ),
                  ksizedbox40,
                  ksizedbox40,
                  InkWell(
                    onTap: (){
                      var type;
                      if(authController.professinalindex.value == 0){
                        type = "Mentor";
                      }else if(authController.professinalindex.value == 1){
                        type = "Trainer";
                      }else if(authController.professinalindex.value == 2){
                        type = "Guide";
                      }
                      authController.studentProfessionaltype(type: type);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                          color: kblue, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'Continue',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16, color: kwhite),
                      )),
                    ),
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
