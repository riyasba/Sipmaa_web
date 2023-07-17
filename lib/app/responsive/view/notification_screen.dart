import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:reg_login/app/data/models/notification_model.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import 'package:reg_login/app/responsive/view/friendsrespo.dart';
import 'package:reg_login/app/responsive/view/from_notification_view/notification_comment_view.dart';
import 'package:reg_login/app/responsive/view/from_notification_view/notification_reaction_screen_view.dart';

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
  final homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    profileController.getNotificationList();
  }

  redirectToPages({dynamic response}) async {
    NotificationDataModel notificationModel =
        NotificationDataModel.fromJson(response);

    if (notificationModel.type == "like_Post") {
      Get.offAll(NotficationReactionView(
        likeCount: 100,
        postId: int.parse(notificationModel.id.toString()),
      ));
    } else if (notificationModel.type == "comment_Post") {
      Get.offAll(() => NotoficationCommentView(
            postId: int.parse(notificationModel.id.toString()),
          ));
    } else if (notificationModel.type == "Friend_Request") {
      Get.to(Friends_screen());
    } else if (notificationModel.type == "Friend_Request_accepted") {
      Get.to(Friends_screen());
    } else {
      Get.offAll(() => HomepageRespo());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ComenappBarmob(),
      ),
      drawer: const MobileDrawer(),
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
                      var data = profileController.notificationList[index].data
                          .toJson();
                      redirectToPages(response: data);
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
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
