import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/auth_controllers.dart';
import '../../data/models/register_model.dart';
import '../../data/models/widgets/password_text_field.dart';
import '../../data/models/widgets/phone_number_text_field.dart';
import '../widgets/textfield.dart';


class register1 extends StatefulWidget {
  register1({super.key});

  @override
  State<register1> createState() => _register1State();
}

class _register1State extends State<register1> {
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column( children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 37, right: 37, top: 40, bottom: 40),
            child: Container(
              width: double.infinity,
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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/title.jpg',
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
                              textCapitalization: TextCapitalization.words,
                              controller: userNameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "User Name can't be empty";
                                }
                                return null;
                              },     onChanged: (val) {
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
                                      color: Color.fromARGB(0, 158, 158, 158),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                filled: true,
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: authController.isLoading.isTrue
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // _lastNameKey.currentState!.validate();
                                    // if (firstNameController.text.isEmpty) {
                                    //   Get.rawSnackbar(
                                    //     messageText: const Text(
                                    //       "Confirm password must match the new password.",
                                    //       style: TextStyle(color: Colors.white),
                                    //     ),
                                    //     backgroundColor: Colors.red,
                                    //   );
                                    // } else if (lastNameController.text.isEmpty) {
                                    // } else if (userNameController.text.isEmpty) {
                                    // } else if (emailIdController.text.isEmpty) {
                                    // } else if (phoneNumberController.text.isEmpty) {
                                    // } else if (createPassWordController
                                    //     .text.isEmpty) {
                                    // } else if (confirmPasswordController
                                    //     .text.isEmpty) {
                                    // } else {
      
                                    // }
      
                                    if (createPassWordController.text ==
                                        confirmPasswordController.text) {
                                      //register here
      
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
                                          .registerUser(registerModel,true);
                                    } else {
                                      Get.rawSnackbar(
                                        messageText: const Text(
                                          "Confirm password must match the new password.",
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
            ),
          )
        ]),
      ),
    );
  }
}
