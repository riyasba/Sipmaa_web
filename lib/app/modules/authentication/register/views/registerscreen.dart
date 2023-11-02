import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/constands/formfield.dart';
import '../../../../data/models/register_model.dart';
import '../../../../data/models/widgets/password_text_field.dart';
import '../../../../data/models/widgets/phone_number_text_field.dart';
import '../../../../data/models/widgets/textfield.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../data/services/auth_api_service/check_email_verify_api_services.dart';

class RegisterViews extends StatefulWidget {
  const RegisterViews({super.key});

  @override
  State<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var userNameController = TextEditingController();

  var emailIdController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var createPassWordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  CheckVerificationApiService checkVerificationApiService =
      CheckVerificationApiService();

  // final firstNameKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  // final createPassKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

   final GlobalKey<State> _dialogKey = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    userNameController.addListener(checkUser);
  }

  bool isEmailVerified = true;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          key: _dialogKey,
          title: const Text('Verify your email'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Please check your email for confirmation mail.',
                  style: primaryfont.copyWith(fontSize: 13),
                ),
                Text(
                  'Click link in email to verify',
                  style: primaryfont.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Refresh'),
              onPressed: () {
                authController.checkEmailVerification(
                    emailId: emailIdController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void checkForEmailVerify() async {
    const onsec = Duration(seconds: 5);
    Timer timer = Timer.periodic(onsec, (timer) async {
      bool tempIsEmailVerified = await authController.checkEmailVerification(
          emailId: emailIdController.text);

      if (tempIsEmailVerified == true) {
        setState(() {
          isEmailVerified = true;
        });
        timer.cancel();
        Navigator.of(_dialogKey.currentContext!).pop();
      }
    });

      checkEmailVerification({required String emailId}) async {
    bool isverified = false;
    dio.Response<dynamic> response =
        await checkVerificationApiService.checkVerification(emailId: emailId);

    if (response.statusCode == 200) {
      if (response.data["status"] == 1) {
        isverified = true;
      } else {
        isverified = false;
      }
    } else {
      isverified = false;
    }

    return isverified;
  }
  }


  checkUser() {
    authController.checkUserName(userName: userNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(primary: true,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 37, right: 37, top: 40, bottom: 40),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/sipmaa.jpg',
                            height: 150,
                            fit: BoxFit.contain,
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
                        // TextformfieldWidgett(
                        //   text: 'First Name',
                        //   textt: 'First Name',
                        //   controller: firstNameController,
                        // ),
                        // TextformfieldWidgett(
                        //   text: 'Last Name',
                        //   textt: 'Last Name',
                        //   controller: lastNameController,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Text(
                        //           "User Name",
                        //         ),
                        //       ),
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           TextFormField(
                        //             controller: userNameController,
                        //             textCapitalization:
                        //                 TextCapitalization.words,
                        //             autovalidateMode:
                        //                 AutovalidateMode.onUserInteraction,
                        //             validator: (value) {
                        //               if (value!.isEmpty) {
                        //                 return "User Name can't be empty";
                        //               }
                        //               return null;
                        //             },
                        //             decoration: InputDecoration(
                        //               floatingLabelBehavior:
                        //                   FloatingLabelBehavior.never,
                        //               fillColor: Colors.white,
                        //               labelText: 'User Name',
                        //               hintStyle: TextStyle(
                        //                 color: Colors.grey[500],
                        //               ),
                        //               border: OutlineInputBorder(),
                        //               filled: true,
                        //             ),
                        //           ),
                        //           if (userNameController.text.isNotEmpty)
                        //             Obx(
                        //               () => authController
                        //                       .isUserNameAvailable.isFalse
                        //                   ? Text(
                        //                       'Not Available',
                        //                       style: TextStyle(
                        //                           color: Colors.red,
                        //                           fontSize: 12,
                        //                           fontWeight: FontWeight.w600),
                        //                     )
                        //                   : const Text(
                        //                       'Available',
                        //                       style: TextStyle(
                        //                           color: Colors.green,
                        //                           fontSize: 12,
                        //                           fontWeight: FontWeight.w600),
                        //                     ),
                        //             )
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Text(
                        //           "Email ID",
                        //         ),
                        //       ),
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           TextFormField(
                        //             textCapitalization:
                        //                 TextCapitalization.words,
                        //             controller: emailIdController,
                        //             autovalidateMode:
                        //                 AutovalidateMode.onUserInteraction,
                        //             validator: (value) {
                        //               if (value!.isEmpty) {
                        //                 return "Email ID can't be empty";
                        //               }
                        //               return null;
                        //             },
                        //             decoration: InputDecoration(
                        //               floatingLabelBehavior:
                        //                   FloatingLabelBehavior.never,
                        //               fillColor: Colors.white,
                        //               labelText: 'Email Id',
                        //               hintStyle: TextStyle(
                        //                 color: Colors.grey[500],
                        //               ),
                        //               border: OutlineInputBorder(),
                        //               filled: true,
                        //             ),
                        //           ),
                        //           // Text(
                        //           //   'Availabe',
                        //           //   style: TextStyle(
                        //           //       color: Colors.green,
                        //           //       fontSize: 12,
                        //           //       fontWeight: FontWeight.w600),
                        //           // )
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // // TextformfieldWidget(
                        // //   text: 'User Name',
                        // //   textt: "User Name",
                        // // ),
                        // TextformfieldWidgett(
                        //   text: 'Phone Number',
                        //   textt: 'Phone Number',
                        //   controller: phoneNumberController,
                        // ),
                        // TextformfieldWidgett(
                        //   text: 'Create Password',
                        //   textt: 'Create Password',
                        //   controller: createPassWordController,
                        // ),
                        // // TextformfieldWidget(
                        // //     text: 'Enter Email Id', textt: 'Email Id'),
                        // TextformfieldWidgett(
                        //   text: 'Confirm Password',
                        //   textt: 'Confirm Password',
                        //   controller: confirmPasswordController,
                        // ),
                        TextformfieldWidget(
                            controller: firstNameController,
                            validationText: "First name can't be empty",
                            text: 'First Name',
                            textt: 'First Name'),
                        TextformfieldWidget(
                            controller: lastNameController,
                            validationText: "Last name can't be empty",
                            text: 'Last Name',
                            textt: 'Last Name'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "User Name",
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: userNameController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "User Name can't be empty";
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: Colors.grey[250],
                                      labelText: 'User Name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          17.0, 8.0, 17.0, 7.0),
                                    ),
                                  ),
                                  if (userNameController.text.isNotEmpty)
                                    GetBuilder<AuthController>(
                                      builder: (_) => authController
                                              .isUserNameAvailable.isFalse
                                          ? const Text(
                                              'Not Available',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : const Text(
                                              'Available',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Email ID",
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                controller: emailIdController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email ID can't be empty";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  print("changes-------------------------");
                                  setState(() {
                                    isEmailVerified = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor: Colors.grey[250],
                                  labelText: 'Enter Email ID',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(0, 158, 158, 158),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  filled: true,
                                  suffixIcon: emailIdController.text.length > 3
                                      ? isEmailVerified
                                          ? Container(
                                              width: 30,
                                              child: Icon(
                                                Icons.verified,
                                                color: Colors.green,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () async {
                                                if (emailIdController
                                                    .text.isEmail) {
                                                  bool isEmailSent =
                                                      await authController
                                                          .sendEmailVerification(
                                                              emailId:
                                                                  (emailIdController
                                                                      .text));

                                                  if (isEmailSent == true) {
                                                    checkForEmailVerify();
                                                    _showMyDialog();
                                                  }
                                                } else {
                                                  Get.rawSnackbar(
                                                      message:
                                                          "Enter a valid Email Id");
                                                }
                                              },
                                              child: Container(
                                                width: 60,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 3),
                                                      child: Container(
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10,
                                                                    right: 10),
                                                            child: Text(
                                                              "Verify",
                                                              style: primaryfont
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                      : Container(
                                          width: 5,
                                        ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(0, 158, 158, 158),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(0, 158, 158, 158),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      17.0, 8.0, 17.0, 7.0),
                                ),
                              ),
                              // const Text(
                              //   'Verify',
                              //   style: TextStyle(
                              //       color: Colors.green,
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.w600),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                        // TextformfieldWidget(
                        //   text: 'User Name',
                        //   textt: "User Name",
                        // ),
                        TextPhoneformfieldWidget(
                            controller: phoneNumberController,
                            text: 'Phone Number',
                            textt: 'Phone Number'),
                        PassWordTextformfieldWidget(
                            controller: createPassWordController,
                            validationText: "Create Password can't be empty",
                            text: 'Create Password',
                            textt: 'Create Password'),
                        // TextformfieldWidget(
                        //     text: 'Enter Email Id', textt: 'Email Id'),
                        PassWordTextformfieldWidget(
                            controller: confirmPasswordController,
                            validationText: "Conform Password can't be empty",
                            text: 'Confirm Password',
                            textt: 'Confirm Password'),
                        ksizedbox10,
                        ksizedbox10,
                        ksizedbox10,
                        Obx(
                          () => SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: authController.isLoading.isTrue
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                          0xFF3C73B1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {
                                    
                                      },
                                      // Get.off(otp_page());

                                      child: CircularProgressIndicator()
                                      // Text(
                                      //   'Register',
                                      //   style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold),
                                      // )
                                      )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF3C73B1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {

                                        if(isEmailVerified){

                                            if (createPassWordController.text ==
                                              confirmPasswordController.text) {
                                            print(
                                                "----------------------------changes------------------------");
                                            print(firstNameController.text);
                                            print(userNameController.text);
                                            print(phoneNumberController.text);
                                            print(emailIdController.text);
                                            RegisterModel registerModel =
                                                RegisterModel(
                                                    email: emailIdController.text,
                                                    lastname: lastNameController.text,
                                                    mobile:phoneNumberController.text,
                                                    name: firstNameController.text,
                                                    username: userNameController.text,
                                                    passwordConfirmation: confirmPasswordController.text,
                                                    password:createPassWordController.text,
                                                    usertype: authController.wayIndex.value == 0
                                                             ? "Student"
                                                             : "Professional",
                                                    );
                                            print(
                                                "-----------------------on here-----${registerModel.usertype}---------------");
                                            authController.registerUser(
                                                registerModel, false);
                                          } else {
                                            Get.rawSnackbar(
                                              messageText: const Text(
                                                "Confirm password must match the new password.",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              backgroundColor: Colors.red,
                                            );
                                          }

                                        }else{
                                          Get.rawSnackbar(
                                          messageText: const Text(
                                            "Verify your email to continue.",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red,
                                        );
                                        }
                                        }
                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                            ),
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
      ),
    );
  }
}
