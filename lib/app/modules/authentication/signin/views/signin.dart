import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/components/constands/constands.dart';
//import '../../../../data/components/constands/constands.dart';

import '../../../../data/components/controllers/auth_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding:
            const EdgeInsets.only(left: 45, right: 45, bottom: 20, top: 30),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(blurRadius: 5,
                  color: kgrey,
                  offset: Offset(0.0, 0.75))
                ]),
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
                                              BorderRadius.circular(15),
                                          child: Container(
                                             decoration: BoxDecoration(
                                                     color: kblue,
                                                     boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kblue
                                                      )
                                                     ]
                                             ),
                                           
                                            width: 600,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    
                                                    child: Image.network(
                                                        authController
                                                            .sliderList[i]
                                                            .image,height: 45,width: 100,fit: BoxFit.fitHeight,),
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
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 0),
                                                      child: Text(
                                                          authController
                                                              .sliderList[i]
                                                              .title,
                                                          style: TextStyle(
                                                              color: kwhite,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 10),
                                                      child: Text(
                                                        authController
                                                            .sliderList[i]
                                                            .description,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ksizedbox10,
                                  Row(
                                    children: [
                                      Text(
                                        "WELCOME",
                                        style:GoogleFonts.openSans(
                                          fontSize: 24.5,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                    ],
                                  ),
                            
                                  // Text(
                                  //   'Login',
                                  //   style: ktextstyle,
                                  // ),
                            
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          'LOGIN BACK TO SIPMAA HR COMMUNITY',
                                          style: GoogleFonts.openSans(
                                            fontSize: 18,fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ksizedbox30,
                            
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User Name',
                                        ).text.semiBold.make(),
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
                                         //  fillColor: Colors.grey[250],
                                            labelText: 'Enter User name',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                            filled: true,
                                      //  border: InputBorder.none,
                                      fillColor: Colors.grey[250],
                                     isDense: true, // Reduces height a bit
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),

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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),ksizedbox20,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Password').text.semiBold.make(),
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
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),

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
                                          } else if (value.length < 8) {
                                            return "Password must be of eight characters";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            Get.toNamed('/forgot-password'),
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(color: Colors.grey),
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
                                  // CUSTOMBUTTON(
                                  //   onTap: () {
                                  //     Get.toNamed('/home-screen');
                                  //   },
                                  //   text: 'Login',
                                  // ),
                                
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
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 1,
                            color: kwhite
                          )
                        ]
                      ),
                        child: Image.asset('assets/images/Group 1927.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
