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

  // final firstNameKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  // final createPassKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    userNameController.addListener(checkUser);
  }

  checkUser() {
    authController.checkUserName(userName: userNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(
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
                        TextformfieldWidget(
                          text: 'First Name',
                          textt: 'First Name',
                          controller: firstNameController,
                        ),
                        TextformfieldWidget(
                          text: 'Last Name',
                          textt: 'Last Name',
                          controller: lastNameController,
                        ),
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
                                    controller: userNameController,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "User Name can't be empty";
                                      }
                                      return null;
                                    },
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
                                    ),
                                  ),
                                  if (userNameController.text.isNotEmpty)
                                    Obx(
                                      () => authController
                                              .isUserNameAvailable.isFalse
                                          ? Text(
                                              'Not Availabe',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : const Text(
                                              'Availabe',
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
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: emailIdController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email ID can't be empty";
                                      }
                                      return null;
                                    },
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
                                    ),
                                  ),
                                  // Text(
                                  //   'Availabe',
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
                        TextformfieldWidget(
                          text: 'Phone Number',
                          textt: 'Phone Number',
                          controller: phoneNumberController,
                        ),
                        TextformfieldWidget(
                          text: 'Create Password',
                          textt: 'Create Password',
                          controller: createPassWordController,
                        ),
                        // TextformfieldWidget(
                        //     text: 'Enter Email Id', textt: 'Email Id'),
                        TextformfieldWidget(
                          text: 'Conform Password',
                          textt: 'Conform Password',
                          controller: confirmPasswordController,
                        ),
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

                                        RegisterModel registerModel =
                                            RegisterModel(
                                                email: emailIdController.text,
                                                lastname:
                                                    lastNameController.text,
                                                mobile:
                                                    phoneNumberController.text,
                                                name: firstNameController.text,
                                                username:
                                                    userNameController.text,
                                                passwordConfirmation:
                                                    confirmPasswordController
                                                        .text,
                                                password:
                                                    createPassWordController
                                                        .text);

                                        authController
                                            .registerUser(registerModel,false);

                                        //Get.toNamed('/otp-views');
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
                                          if (createPassWordController.text ==
                                              confirmPasswordController.text) {

                                        print("----------------------------changes------------------------");
                                      print(firstNameController.text);
                                      print(userNameController.text);
                                      print(phoneNumberController.text);
                                      print(emailIdController.text);
                                            RegisterModel registerModel =
                                                RegisterModel(
                                                    email:
                                                        emailIdController.text,
                                                    lastname:
                                                        lastNameController.text,
                                                    mobile:
                                                        phoneNumberController
                                                            .text,
                                                    name: firstNameController
                                                        .text,
                                                    username:
                                                        userNameController.text,
                                                    passwordConfirmation:
                                                        confirmPasswordController
                                                            .text,
                                                    password:
                                                        createPassWordController
                                                            .text);
                                            print(
                                                "-----------------------on here----------------------");
                                            authController
                                                .registerUser(registerModel,false);
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
