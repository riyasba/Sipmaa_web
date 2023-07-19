import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/respohome/respoprofil.dart';

import 'package:velocity_x/velocity_x.dart';

import '../data/components/controllers/profile_controller.dart';

class ProfileRespo extends StatefulWidget {
  const ProfileRespo({super.key});

  @override
  State<ProfileRespo> createState() => _ProfileRespoState();
}

class _ProfileRespoState extends State<ProfileRespo> {
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: GetBuilder<ProfileController>(builder: (_) {
            return Container(
              child: profileController.profileData.isEmpty
                  ? Container(
                      height: 6,
                    )
                  : Column(
                      children: [
                        ksizedbox20,
                        profileController
                                    .profileData.first.user.profilePicture ==
                                null
                            ? const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/propic.jpg'),
                                radius: 36,
                              )
                            : InkWell(
                                onTap: () {
                                  Get.to(RespoProfile());
                                  // homeController.homeindex(4);
                                },
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(RespoProfile());
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.network(
                                          profileController.profileData.first
                                              .user.profilePicture,
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 65,
                                        width: 65,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            child: Image.asset(
                                                "assets/icons/silver_badge.png")))
                                  ],
                                ),
                              ),
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${profileController.profileData.first.user.name}   ')
                                .text
                                .bold
                                .xl
                                .make(),
                            // Icon(
                            //   Icons.edit,
                            //   color: kblue,
                            //   size: 17,
                            // )
                          ],
                        ),
                        Text('${profileController.profileData.first.departmentName}')
                            .text
                            .bold
                            .make(),
                        ksizedbox20,
                        Divider(
                          height: 0.5,
                          color: kgrey,
                        ),
                        ksizedbox10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                kwidth10,
                                Text('Current Company :').text.sm.bold.make(),
                              ],
                            ),
                            Row(
                              children: [
                                kwidth10,
                                Text('${profileController.profileData.first.user.currentCompany} ')
                                    .text
                                    .sm
                                    .make(),
                              ],
                            ),
                            ksizedbox10,
                          ],
                        ),
                        Divider(
                          height: 0.5,
                          color: kgrey,
                        ),
                        ksizedbox10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                kwidth10,
                                Text('Designation :').text.sm.bold.make(),
                              ],
                            ),
                            Row(
                              children: [
                                kwidth10,
                                Text('${profileController.profileData.first.user.designation} ')
                                    .text
                                    .sm
                                    .make(),
                              ],
                            ),
                            ksizedbox10,
                          ],
                        ),
                        Divider(
                          height: 0.5,
                          color: kgrey,
                        ),
                        ksizedbox10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                kwidth10,
                                Text('Previously associated :')
                                    .text
                                    .sm
                                    .bold
                                    .make(),
                              ],
                            ),
                            Row(
                              children: [
                                kwidth10,
                                for (int i = 0;
                                    i <
                                        profileController
                                            .profileData.first.positions.length;
                                    i++)
                                  Text('${profileController.profileData.first.positions[i].companyName},')
                                      .text
                                      .sm
                                      .make(),
                              ],
                            ),
                            ksizedbox10,
                            Divider(
                              height: 0.5,
                              color: kgrey,
                            ),
                          ],
                        ),
                        ksizedbox10,
                        Row(
                          children: [
                            kwidth10,
                            Text('About :').text.sm.bold.make(),
                          ],
                        ),
                        Row(
                          children: [
                            kwidth10,
                            Text('${profileController.profileData.first.user.bio ?? ""}')
                                .text
                                .sm
                                .make(),
                          ],
                        ),
                        ksizedbox10,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                ksizedbox10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kwidth10,
                                    Text('Posts').text.semiBold.make(),
                                    Spacer(),
                                    Text('${profileController.profileData.first.totalPosts}')
                                        .text
                                        .semiBold
                                        .make(),
                                    kwidth10
                                  ],
                                ),
                                ksizedbox10,
                                Divider(
                                  height: 1,
                                ),
                                ksizedbox10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kwidth10,
                                    Text('Earned Like').text.semiBold.make(),
                                    Spacer(),
                                    Text('${profileController.profileData.first.totalLikes}')
                                        .text
                                        .semiBold
                                        .make(),
                                    kwidth10
                                  ],
                                ),
                                ksizedbox10,
                                Divider(
                                  height: 1,
                                ),
                                ksizedbox10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kwidth10,
                                    Text('Connects').text.semiBold.make(),
                                    Spacer(),
                                    Text('${profileController.profileData.first.totalFriends}')
                                        .text
                                        .semiBold
                                        .make(),
                                    kwidth10
                                  ],
                                ),
                                ksizedbox10,
                              ],
                            ),
                            width: size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: kgrey,
                                width: 0.5,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(8)),
              width: size.width,
              //  height: size.height * 0.7,
            );
          }),
        ),
        GetBuilder<ProfileController>(builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(92, 75),
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Do you want to Logout ?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
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
                                            backgroundColor:
                                                const Color(0xFF3C73B1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.toNamed('/sign-in');
                                          },
                                          // Get.to(

                                          // BottomNavigationBarExample(),
                                          //);

                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 80,
                                      child: ElevatedButton(
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
                                            Get.back();
                                          },
                                          // Get.to(

                                          // BottomNavigationBarExample(),
                                          //);

                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: profileController.profileData.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kwidth10,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/propic.jpg',
                            height: 35,
                          ),
                        ),
                        kwidth10,
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Log out',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14),
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
                        kwidth10,
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 0),
                          child: Icon(
                            Icons.power_settings_new,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kwidth10,
                        profileController
                                    .profileData.first.user.profilePicture ==
                                null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/propic.jpg',
                                  height: 35,
                                ),
                              )
                            : Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      profileController.profileData.first.user
                                          .profilePicture,
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  Container(
                                      height: 35,
                                      width: 35,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          child: Image.asset(
                                              "assets/icons/silver_badge.png")))
                                ],
                              ),
                        kwidth10,
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Log out',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14),
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
                        kwidth10,
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 0),
                          child: Icon(
                            Icons.power_settings_new,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        }),
      ],
    );
  }
}
