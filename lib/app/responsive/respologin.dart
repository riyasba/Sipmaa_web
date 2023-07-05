import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/responsive/forgotrespo/forgot_page.dart';
import 'package:reg_login/app/responsive/view/forgot_page.dart';
import 'package:reg_login/app/responsive/view/register_page1.dart';
import '../data/components/constands/constands.dart';
import '../data/components/controllers/auth_controllers.dart';

class loginpagerespo extends StatefulWidget {
  const loginpagerespo({super.key});

  @override
  State<loginpagerespo> createState() => _loginpagerespoState();
}

class _loginpagerespoState extends State<loginpagerespo> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  CarouselController curouselController = CarouselController();

  final authController = Get.find<AuthController>();

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  int pageIndex = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authController.getSlider();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 40),
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
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 10,
                                color: Colors.white,
                                width: 600,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 80,
                                        child: Image.network(
                                            authController.sliderList[i].image),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          authController.sliderList[i].title,
                                          style: ktextstyle,
                                        ),
                                        Text(
                                          authController
                                              .sliderList[i].description,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          //   ClipRRect(
                          //     borderRadius: BorderRadius.circular(10),
                          //     child: Container(
                          //       height: 10,
                          //       color: Colors.white,
                          //       width: 600,
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Image.asset(
                          //               'assets/images/group-users 1.jpg'),
                          //           Text(
                          //             'SIPMAA \n HR Community',
                          //             style: ktextstyle,
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(10),
                          //   child: Container(
                          //       height: 10,
                          //       color: Colors.white,
                          //       width: 600,
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Image.asset(
                          //               'assets/images/group-users 1.jpg'),
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
                          //       height: 10,
                          //       color: Colors.white,
                          //       width: 600,
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Image.asset(
                          //               'assets/images/group-users 1.jpg'),
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
                              Duration(milliseconds: 3200),
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
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 1.5,
                                    color: Color.fromARGB(255, 154, 152, 152),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(203, 35, 69, 107),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Container(
                    height: 550,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        ksizedbox10,

                        Text(
                          "Login",
                          style: ktextstyle,
                        ),

                        // Text(
                        //   'Login',
                        //   style: ktextstyle,
                        // ),
                        ksizedbox10,
                        Text(
                          'Welcome to SIPMAA',
                          style: ktextstyle22,
                        ),
                        Text(
                          'HR community ',
                          style: ktextstyle22,
                        ),
                        ksizedbox10,
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'User Name',
                                      ),
                                    ),
                                    TextFormField(
                                      // autofocus: true,
                                      controller: userNameController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "User Name can't be empty";
                                        }
                                        return null;
                                      },
                                      // controller: controller,
                                      // validator: validator,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        fillColor: Colors.grey[250],
                                        labelText: 'Enter User Name',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                        //  border: InputBorder.none,
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
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                17.0, 8.0, 17.0, 7.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Password'),
                                    ),
                                    TextFormField(
                                      // autofocus: true,
                                      controller: passwordController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: !_obscured,
                                      focusNode: textFieldFocusNode,
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
                                            onTap: _toggleObscured,
                                            child: Icon(
                                              _obscured
                                                  ? Icons.visibility_rounded
                                                  : Icons
                                                      .visibility_off_rounded,
                                              color: Colors.grey,
                                              size: 23,
                                            ),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password can't be empty";
                                        } else if (value.length < 6) {
                                          return "Password must be of 6 characters";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {
                                  Get.to(ForgetPassword());
                                  //  Get.to(forgot());
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                        backgroundColor: const Color(
                                          0xFF3C73B1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
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
                                          authController.loginUser(
                                              username: userNameController.text,
                                              password: passwordController.text,
                                              size: size.width);
                                        }
                                      },
                                      child: const Text(
                                        'Login ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                            ),
                          ),
                        ),
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: ktextstyle15gry,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(register1());
                                // Get.to(
                                // register1(),
                                // );
                              },
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
            ),
          ],
        ),
      ),
    );
  }
}
