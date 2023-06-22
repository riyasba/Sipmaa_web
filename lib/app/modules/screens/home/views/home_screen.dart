import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/modules/screens/home/views/chat.dart';
import 'package:reg_login/app/modules/screens/home/views/create_widget.dart';
import 'package:reg_login/app/modules/screens/home/views/notification_widget.dart';
import 'package:reg_login/app/modules/screens/Settings/views/settingss.dart';
//import 'package:reg_login/app/modules/screens/Settings/views/widgets/change_password.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/friends_search_screen.dart';
import 'package:reg_login/app/modules/screens/profile/views/profile_pagee.dart';
import 'package:reg_login/app/modules/screens/home/views/searchcontainer.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
//import 'package:reg_login/controller/home_controller.dart';
//import 'package:reg_login/widget/filtter_widget.dart';
//import 'package:reg_login/widget/home_friends.dart';
//import 'package:reg_login/widget/search_container.dart';

import '../../../../data/components/controllers/posts_controller.dart';
import '../../../../data/components/search_field.dart';
//import '../../profile/views/profile_page.dart';
import 'widgets/friends_widget.dart';
//import '../widget/home_container.dart';
//import '../widget/search_field.dart';
import '../controler/controler.dart';
import 'filter_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController textController = TextEditingController();

class _HomePageState extends State<HomePage> {
  int index = 0;
  final homeController = Get.find<HomeController>();
  final postsController = Get.find<PostsController>();
  final profileCn = Get.find<ProfileController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    postsController.getAllPost();
    profileCn.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCAE1FF),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        actions: [
          // InkWell(
          //   onTap: (){
          //     homeController.homeindex(1);
          //                     homeController.update();
          //    // Get.to(FriendsSearch());
          //   },
          //   child: SearchWidget(
          //     textController: textController,
          //   ),
          // ),
          IconButton(
              onPressed: () {
                homeController.homeindex(7);
                homeController.update();
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                homeController.homeindex(3);
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
          GetBuilder<ProfileController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: profileController.profileData.first.user.profilePicture ==
                      null
                  ? const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_icon.png'),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(profileController
                          .profileData.first.user.profilePicture),
                    ),
            );
          }),
        ],
      ),
      body: Row(
        children: [
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width / 8,
              color: kblue,
              child: Column(
                children: [
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 0
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(0);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: homeController.homeindex.value == 0
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        color:
                                            homeController.homeindex.value == 0
                                                ? kblue
                                                : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 1
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(1);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color:  homeController.homeindex == 1
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                        color: homeController.homeindex == 1
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: homeController.homeindex == 2
                                    ? kwhite
                                    : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(2);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_alt_rounded,
                                  color: homeController.homeindex == 2
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(
                                        color: homeController.homeindex == 2
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: homeController.homeindex == 3
                                    ? kwhite
                                    : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(3);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: homeController.homeindex == 3
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 0),
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                        color: homeController.homeindex == 3
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: homeController.homeindex == 4
                                    ? kwhite
                                    : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(4);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: homeController.homeindex == 4
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                        color: homeController.homeindex == 4
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: homeController.homeindex.value == 5
                                ? kwhite
                                : kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          homeController.homeindex(5);
                          homeController.update();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color:  homeController.homeindex == 5
                                  ? kblue
                                  : kwhite,
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 6),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                    color: homeController.homeindex == 5
                                        ? kblue
                                        : kwhite,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        )),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 6
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(6);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: homeController.homeindex == 6
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Friends',
                                    style: TextStyle(
                                        color: homeController.homeindex == 6
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 8
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              homeController.homeindex(8);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: homeController.homeindex == 8
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  child: Text(
                                    'Chats',
                                    style: TextStyle(
                                        color: homeController.homeindex == 8
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 135),
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
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
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Text(
                                                'Do you want to LogOut ?',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w900),
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: Color(
                                                          0xFF3C73B1,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Get.toNamed('/sign-in');
                                                      },
                                                      // Get.to(

                                                      // BottomNavigationBarExample(),
                                                      //);

                                                      child: Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: 80,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: Color(
                                                          0xFF3C73B1,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                                FontWeight
                                                                    .bold),
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
            ),
          ),
          Obx(
            () => SizedBox(
              // width: 135
              width: homeController.homeindex == 2 ||
                      homeController.homeindex.value == 4
                  ? 0
                  : 135,
            ),
          ),
          Obx(
            () => Row(
              children: [
                if (homeController.homeindex.value == 0) HomeContainer(),
                if (homeController.homeindex.value == 1) SearchContainer(),
                if (homeController.homeindex.value == 2) FillterWidget(),
                if (homeController.homeindex.value == 3) NotificationWidget(),
                if (homeController.homeindex.value == 4) ProfileScreen(),
                if (homeController.homeindex.value == 5) CreateWidget(),
                if (homeController.homeindex.value == 6) FriendsSearch(),
                if (homeController.homeindex.value == 7) SettingsPage(),
                if (homeController.homeindex.value == 8) Chat(),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              // width: 135
              width: homeController.homeindex == 2
                  ? 100
                  : homeController.homeindex == 4
                      ? 0
                      : 135,
            ),
          ),
          Obx(
            () => Row(
              children: [
                if (homeController.homeindex.value != 4 &&
                    homeController.homeindex.value != 7)
                  HomeFriendsWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
