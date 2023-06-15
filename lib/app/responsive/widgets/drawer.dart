import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

import '../view/friends.dart';
import '../view/home_respo.dart';
import '../view/notification_screen.dart';
import '../view/profile_page.dart';
import '../view/register_page1.dart';
import '../view/setting_proifile_page.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  //   void _showModalSheet() {
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //       context: context,
  //       builder: (builder) {
  //         return new Container(
  //           height: 162,
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 28,
  //               ),
  //               new Center(
  //                   child: new Text(
  //                 "Do you want to LogOut?",
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //               )),
  //               SizedBox(
  //                 height: 32,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           minimumSize: Size(100, 40),
  //                           backgroundColor: kblue,
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(18))),
  //                       onPressed: () async {
  //                      //   final prefs = await SharedPreferences.getInstance();
  //                      //   await prefs.setString("auth_token", "null");
  //                         //      Get.to(loginpage());
  //                       },
  //                       child: Text(
  //                         'Log Out',
  //                         style: TextStyle(fontSize: 15, color: kwhite),
  //                       )),
  //                   SizedBox(
  //                     width: 40,
  //                   ),
  //                   OutlinedButton(
  //                       style: OutlinedButton.styleFrom(
  //                           side: BorderSide(color: kblue, width: 1),
  //                           minimumSize: Size(110, 40),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(18),
  //                           )),
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: Text(
  //                         'Cancel',
  //                         style: TextStyle(fontSize: 15, color: kblue),
  //                       ))
  //                 ],
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblue,
      shadowColor: Colors.white,
      child: ListView(
        children: [
          Row(
            children: [
              // Image.asset('')
            ],
          ),
          //   ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {Get.to(HomepageRespo());
                      //  Get.to(MobileHome());
                    },
                    child: Text(
                      'HOME',
                      style: TextStyle(fontSize: 16, color: kwhite),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(Friends_screen());
                      //    Get.to(RespoContact());
                    },
                    child: Text(
                      'FRIENDS',
                      style: TextStyle(fontSize: 16, color: kwhite),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {Get.to(Notificaton_screen());
                      //    Get.to(RespoServices());
                    },
                    child: Text(
                      'NOTIFICATION',
                      style: TextStyle(fontSize: 16, color: kwhite),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(ProfilePage());
                      //  Get.to(RespoServices());
                    },
                    child: Text(
                      'PROFILE',
                      style: TextStyle(fontSize: 16, color: kwhite),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),

  Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () { Navigator.of(context).pop();
                                 SettingProfilePage();
                      
                      //  Get.to(RespoServices());
                    },
                    child: Text(
                      'SETTINGS',
                      style: TextStyle(fontSize: 16, color: kwhite),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                      register1(),
                    );
                    //   Get.to(landing_screen());
                  },
                  child: Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        //    gradient: LinearGradient(colors: [kyellow, kOrange]),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
