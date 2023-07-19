import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:reg_login/app/data/components/controllers/chat_controller.dart';
import 'package:reg_login/app/respohome/notification/responotification.dart';
import 'package:reg_login/app/respohome/respochat/respochat.dart';
import 'package:reg_login/app/respohome/respocreate.dart';
import 'package:reg_login/app/respohome/respoprofil.dart';

import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../responsive/view/profile_page.dart';
import '../resposetings/respo_settings.dart';
import '../respohome.dart';
import '../searchrespo/saerchrespo.dart';

class AppbarComn extends StatefulWidget {
  const AppbarComn({
    super.key,
  });

  @override
  State<AppbarComn> createState() => _AppbarComnState();
}

class _AppbarComnState extends State<AppbarComn> {
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kwhite,
      //const Color(0xffCAE1FF),
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      actions: [
        kwidth10,
        IconButton(
            onPressed: () {
              Get.to(MyHomePage());
            },
            icon: Icon(
              Icons.home,
              color: kblue,
            )),
        kwidth10,
        IconButton(
            onPressed: () {
              Get.to(RespoCreate());
            },
            icon: Icon(
              Icons.add_a_photo_outlined,
              color: kblue,
            )),
        kwidth10,
        IconButton(
            onPressed: () {
              Get.to(RespoSrech());
            },
            icon: Icon(
              Icons.search,
              color: kblue,
            )),
        kwidth10,
        // IconButton(
        //     onPressed: () {
        //       Get.to(RespoChat());
        //     },
        //     // onPressed: () {
        //     //   homeController.homeindex(7);
        //     //   homeController.update();
        //     // },
        //     icon: Icon(
        //       Icons.chat,
        //       color: kblue,
        //     )),
        // kwidth10,
        GetBuilder<ProfileController>(builder: (_) {
          return profileController.profileData.isEmpty
              ? IconButton(
                  onPressed: () {
                    Get.to(RespoChat());
                  },
                  // onPressed: () {
                  //   homeController.homeindex(7);
                  //   homeController.update();
                  // },
                  icon: Icon(
                    Icons.chat,
                    color: kblue,
                  ))
              : StreamBuilder<QuerySnapshot>(
                  stream: Get.find<ChatController>().getUnreadCound(
                      profileController.profileData.first.user.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return IconButton(
                          onPressed: () {
                            Get.to(RespoChat());
                          },
                          // onPressed: () {
                          //   homeController.homeindex(7);
                          //   homeController.update();
                          // },
                          icon: Icon(
                            Icons.chat,
                            color: kblue,
                          ));
                    } else if (snapshot.data == null) {
                      return IconButton(
                          onPressed: () {
                            Get.to(RespoChat());
                          },
                          // onPressed: () {
                          //   homeController.homeindex(7);
                          //   homeController.update();
                          // },
                          icon: Icon(
                            Icons.chat,
                            color: kblue,
                          ));
                    } else if (snapshot.data!.docs.isEmpty) {
                      return IconButton(
                          onPressed: () {
                            Get.to(RespoChat());
                          },
                          // onPressed: () {
                          //   homeController.homeindex(7);
                          //   homeController.update();
                          // },
                          icon: Icon(
                            Icons.chat,
                            color: kblue,
                          ));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(RespoChat());
                                },
                                // onPressed: () {
                                //   homeController.homeindex(7);
                                //   homeController.update();
                                // },
                                icon: Icon(
                                  Icons.chat,
                                  color: kblue,
                                )),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.data!.docs.length > 9
                                      ? "+9"
                                      : "${snapshot.data!.docs.length}",
                                  style: primaryfont.copyWith(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  });
        }),
        kwidth10,
        IconButton(
            onPressed: () {
              Get.to(RespSetings());
            },
            icon: Icon(
              Icons.settings_outlined,
              color: kblue,
            )),
        kwidth10,
        GetBuilder<ProfileController>(builder: (_) {
          return profileController.profileData.isEmpty
              ? IconButton(
                  onPressed: () {
                    Get.to(RespoNotification());
                  },
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: kblue,
                  ))
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(RespoNotification());
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: kblue,
                          )),
                      if (profileController.notificationCount.value > 0)
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(
                              profileController.notificationCount.value > 9
                                  ? "+9"
                                  : "${profileController.notificationCount.value}",
                              style: primaryfont.copyWith(
                                  color: Colors.white, fontSize: 8),
                            ),
                          ),
                        )
                    ],
                  ),
                );
        }),
        kwidth10,
        InkWell(
          onTap: () {
            Get.to(RespoProfile());
            // homeController.homeindex(4);
          },
          child: GetBuilder<ProfileController>(
            builder: (_) {
              return profileController.profileData.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: profileController
                                  .profileData.first.user.profilePicture ==
                              null
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/propic.jpg'),
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(profileController
                                  .profileData.first.user.profilePicture),
                            ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
