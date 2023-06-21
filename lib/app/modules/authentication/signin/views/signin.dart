import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/components/constands/constands.dart';
//import '../../../../data/components/constands/constands.dart';

import '../../../../data/components/controllers/auth_controllers.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

CarouselController curouselController = CarouselController();

//  @override
//   void initState() {
//     super.initState();
//     authController.getSlider();
//   }

class _SignInViewState extends State<SignInView> {
  int pageIndex = 0;
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    authController.getSlider();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblue,
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    //      width: 500,
                    //      height: 700,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                GetBuilder<AuthController>(builder: (_) {
                                  return CarouselSlider(
                                    carouselController: curouselController,
                                    items: [
                                      for (int i = 0;
                                          i < authController.sliderList.length;
                                          i++)
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 8,
                                            color: kblue,
                                            width: 600,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Container(
                                                    width: 80,
                                                    child: Image.network(
                                                        authController
                                                            .sliderList[i]
                                                            .image),
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   'assets/images/group-users 1.jpg'),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        authController
                                                            .sliderList[i]
                                                            .title,
                                                        style: TextStyle(
                                                            color: kwhite,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    Text(
                                                      authController
                                                          .sliderList[i]
                                                          .description,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //       height: 8,
                                      //       color: kblue,
                                      //       width: 600,
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceEvenly,
                                      //         children: [
                                      //           //   Image.asset(
                                      //           //     'assets/images/group-users 1.jpg'),
                                      //           Text(
                                      //             'SIPMAA \n HR Community',
                                      //             style: ktextstyle,
                                      //           )
                                      //         ],
                                      //       )),
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //       height: 8,
                                      //       color: kblue,
                                      //       width: 500,
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceEvenly,
                                      //         children: [
                                      //           //  Image.asset(
                                      //           //    'assets/images/group-users 1.jpg'),
                                      //           Text(
                                      //             'SIPMAA \n HR Community',
                                      //             style: ktextstyle,
                                      //           )
                                      //         ],
                                      //       )),
                                      // ),
                                    ],
                                    options: CarouselOptions(
                                      height: 120.0,
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 3200),
                                      viewportFraction: 0.8,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          pageIndex = index;
                                        });
                                      },
                                    ),
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 6,
                                    width: 55,
                                    child: Row(
                                      mainAxisAlignment: pageIndex == 0
                                          ? MainAxisAlignment.start
                                          : pageIndex == 1
                                              ? MainAxisAlignment.center
                                              : MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 23,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 1.5,
                                                color: Color.fromARGB(
                                                    255, 154, 152, 152),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            203, 35, 69, 107),
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                )
                              ],
                            )),
                        Center(
                          child: Container(
                            width: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ksizedbox10,
                                const Text(
                                  "WELCOME",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),

                                // Text(
                                //   'Login',
                                //   style: ktextstyle,
                                // ),

                                Text(
                                  'Login Back to Sipmaa HR Community',
                                  style: ktextstyle22,
                                ),
                                ksizedbox10,

                                Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'User Name',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: userNameController,
                                        autofocus: true,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        // validator: (value) {
                                        //   if (value!.isEmpty) {
                                        //     return "Email can't be empty";
                                        //   } else if (!RegExp(
                                        //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        //       .hasMatch(value)) {
                                        //     return "Enter correct email";
                                        //   }
                                        //   return null;
                                        // },
                                        // controller: controller,
                                        // validator: validator,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Colors.grey[250],
                                          labelText: 'Enter Email Id',
                                          hintStyle: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                          //  border: InputBorder.none,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                style: BorderStyle.none,
                                                color: Color.fromARGB(
                                                    241, 255, 255, 255),
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  17.0, 8.0, 17.0, 7.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Password'),
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      autofocus: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: isPasswordVisible,
                                      // focusNode: textFieldFocusNode,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior
                                            .never, //Hides label on focus or if filled
                                        labelText: " Password",
                                        filled: true,
                                        //  border: InputBorder.none,
                                        fillColor: Colors.grey[250],
                                        isDense: true, // Reduces height a bit
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),

                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 4, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isPasswordVisible =
                                                    !isPasswordVisible;
                                              });
                                            },
                                            child: Icon(
                                              // Icons.visibility_off_rounded
                                              isPasswordVisible
                                                  ? Icons.visibility_rounded
                                                  : Icons
                                                      .visibility_off_rounded,
                                              color: Colors.grey,
                                              // size: 23,
                                            ),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password can't be empty";
                                        } else if (value.length < 4) {
                                          return "Password must be of four characters";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        onPressed: () =>
                                            Get.toNamed('/forgot-password'),
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //  ksizedbox10,
                                // ksizedbox10,
                                Obx(
                                  () => SizedBox(
                                    height: 45,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: authController.isLoading.isTrue
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF3C73B1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.white,
                                              ))
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF3C73B1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  authController.loginUser(
                                                      size: size.width,
                                                      username:
                                                          userNameController
                                                              .text,
                                                      password:
                                                          passwordController
                                                              .text);
                                                }
                                              },
                                              child: const Text(
                                                'Login ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                    ),
                                  ),
                                ),
                                // CUSTOMBUTTON(
                                //   onTap: () {
                                //     Get.toNamed('/home-screen');
                                //   },
                                //   text: 'Login',
                                // ),
                                ksizedbox10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: ktextstyle15gry,
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Get.toNamed('/register-page'),
                                      child: Text(
                                        'Register Now',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF3C73B1),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        child: Image.asset('assets/images/Group 89.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
