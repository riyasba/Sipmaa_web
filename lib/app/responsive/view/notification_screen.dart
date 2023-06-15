import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'package:get/get.dart';


import '../../data/components/controllers/posts_controller.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../widgets/comonmobappbar.dart';
import '../widgets/drawer.dart';
import 'home_respo.dart';

class Notificaton_screen extends StatefulWidget {
  const Notificaton_screen({super.key});

  @override
  State<Notificaton_screen> createState() => _Notificaton_screenState();
}

class _Notificaton_screenState extends State<Notificaton_screen> {
  final profileController = Get.find<ProfileController>();

  final postController = Get.find<PostsController>();
  @override
  void initState() {
    super.initState();
    profileController.getNotificationList();
  }

  // redirectToPages({dynamic response}) async {
  //   NotificationDataModel notificationModel =
  //       NotificationDataModel.fromJson(response);

  //   if (notificationModel.type == "like_Post") {
  //     Get.offAll(NotficationReactionView(
  //       likeCount: 100,
  //       postId: int.parse(notificationModel.id.toString()),
  //     ));
  //   } else if (notificationModel.type == "comment_Post") {
  //     Get.offAll(() => NotoficationCommentView(
  //           postId: int.parse(notificationModel.id.toString()),
  //         ));
  //   } else if (notificationModel.type == "Friend_Request") {
  //     Get.offAll(() => BottomNavigationBarExample(
  //           index: 1,
  //         ));
  //   } else if (notificationModel.type == "Friend_Request_accepted") {
  //     Get.offAll(() => BottomNavigationBarExample(
  //           index: 1,
  //         ));
  //   } else {
  //     Get.offAll(() => BottomNavigationBarExample());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ComenappBarmob(),
      ),
      drawer: MobileDrawer(),
      body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.notificationList.isEmpty
            ? const Center(
                child: Text("No Data"),
              )
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: profileController.notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var data = jsonDecode(
                          profileController.notificationList[index].data);

                      //     redirectToPages(response: data);
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/icons/profile_icon.png'),
                      ),
                      title: Row(
                        children: [
                          Text(
                            profileController.notificationList[index].title,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      subtitle: Text(
                          profileController.notificationList[index].message),
                      trailing: const Text(
                        '',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
              );
      }),
    );
  }
}
