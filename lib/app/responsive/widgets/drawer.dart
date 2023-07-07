import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/responsive/respologin.dart';
import 'package:reg_login/app/responsive/view/search_friends/search_friends_view.dart';
import 'package:reg_login/app/responsive/widgets/chat_view/chat_list_view.dart';

import '../../modules/screens/home/views/widgets/friends_widget.dart';

import '../view/friendsrespo.dart';
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
                    onPressed: () {
                      Get.to(HomepageRespo());
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
                    onPressed: () {
                      Get.to(const Notificaton_screen());
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
                    onPressed: () {
                      Get.to(ChatListView());
                      // Navigator.of(context).pop();
                      //         SettingProfilePage();

                      //  Get.to(RespoServices());
                    },
                    child: Text(
                      'CHAT',
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
                      Get.to(SearchFriends());
                      // Navigator.of(context).pop();
                      //         SettingProfilePage();

                      //  Get.to(RespoServices());
                    },
                    child: Text(
                      'FRIENDS SEARCH',
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
          //   Padding(
          //   padding: const EdgeInsets.only(top: 10, left: 10),
          //   child: Row(
          //     children: [
          //       TextButton(
          //           onPressed: () {Get.to(
          //             HomeFriendsWidget()
          //             );
          //             // Navigator.of(context).pop();
          //               //         SettingProfilePage();

          //             //  Get.to(RespoServices());
          //           },
          //           child: Text(
          //             'Friends',
          //             style: TextStyle(fontSize: 16, color: kwhite),
          //           ))
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
          //   child: Divider(
          //     color: kgrey,
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 100),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Get.to(
          //             register1(),
          //           );
          //           //   Get.to(landing_screen());
          //         },
          //         child: Container(
          //           height: 30,
          //           width: 110,
          //           decoration: BoxDecoration(
          //               color: Colors.green,
          //               //    gradient: LinearGradient(colors: [kyellow, kOrange]),
          //               borderRadius: BorderRadius.circular(8)),
          //           child: Center(
          //             child: Text(
          //               'REGISTER',
          //               style: TextStyle(color: kwhite),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 100),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(52, 52),
                    backgroundColor: kwhite.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: kwhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    ksizedbox10,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Do you want to LogOut ?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    ksizedbox30,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(
                                                  0xFF3C73B1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.to(loginpagerespo());
                                                //   Get.toNamed('/sign-in');
                                              },
                                              // Get.to(

                                              // BottomNavigationBarExample(),
                                              //);

                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(
                                                  0xFF3C73B1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              // Get.to(

                                              // BottomNavigationBarExample(),
                                              //);

                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 6),
                      child: Column(
                        children: [
                          Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 12),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 1),
                          //   child: Text(
                          //     'Developer',
                          //     style: TextStyle(
                          //         fontSize: 8,
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w800),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 5),
                      child: Icon(
                        Icons.power_settings_new,
                        size: 17,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
