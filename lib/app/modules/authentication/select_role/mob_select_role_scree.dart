import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/responsive/view/mob_register_screen.dart';

class MobSelectRoleScreen extends StatefulWidget {
  const MobSelectRoleScreen({super.key});

  @override
  State<MobSelectRoleScreen> createState() => _MobSelectRoleScreenState();
}

class _MobSelectRoleScreenState extends State<MobSelectRoleScreen> {

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:const Center(child: Image(image: AssetImage('assets/images/title.jpg'))),
      bottomNavigationBar: Container(
            height: 300,
            decoration:const BoxDecoration(
              color: Color(0xFF3C73B1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Are You?",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          authController.wayIndex(0);
                          Get.to(MobRegisterScreen());
                        },
                        child: Container(
                          height: 110,
                          width: 150,
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child:const Center(
                            child: Padding(
                              padding:  EdgeInsets.only(top: 10,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Image(image: AssetImage("assets/icons/cap.png"),
                                  height: 50,width: 50,),
                                  Text("Student",style: TextStyle(color: Color(0xFF3C73B1),fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          authController.wayIndex(1);
                          Get.to(MobRegisterScreen());
                        },
                        child: Container(
                          height: 110,
                          width: 150,
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child:const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image(image: AssetImage("assets/icons/suitcase.png"),
                                  height: 50,width: 50,),
                                  Text("Professional",style: TextStyle(color: Color(0xFF3C73B1),fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}