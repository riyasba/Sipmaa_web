import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/models/notification_model.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import '../../../../data/components/controllers/profile_controller.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool _isfavorite = false;
  bool _isfavorite2 = false;
  var commentController = TextEditingController();
  var dialogeController = TextEditingController();
  final postController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();
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
      homeController.homeindex(4);
    } else if (notificationModel.type == "comment_Post") {
      homeController.homeindex(4);
    } else if (notificationModel.type == "Friend_Request") {
      homeController.homeindex(0);
    } else if (notificationModel.type == "Friend_Request_accepted") {
      homeController.homeindex(0);
    } else {
      homeController.homeindex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kwhite, borderRadius: BorderRadius.circular(8)),
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,

      child: GetBuilder<ProfileController>(builder: (_) {
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
                      var data = profileController
                          .notificationList[index].data
                          .toJson();

                      redirectToPages(response: data);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: profileController.notificationList[index]
                                      .data.profilePicture ==
                                  ""
                              ? InkWell(
                                  onTap: () {
                                    // Get.to(() => PublicUserProfilePage(
                                    //       userId: profileController
                                    //           .notificationList[index].data.id,
                                    //     ));
                                  },
                                  child: const CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'assets/icons/profile_icon.png')),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      profileController.notificationList[index]
                                          .data.profilePicture)),
                          // title: Row(
                          //   children: [
                          //     Text(
                          //       profileController.notificationList[index].title,
                          //       style: const TextStyle(
                          //           fontWeight: FontWeight.w700),
                          //     ),
                          //   ],
                          // ),
                          title: Text(
                            profileController.notificationList[index].message,
                            style: primaryfont.copyWith(
                                fontSize: 14, color: Colors.black54),
                          ),
                          trailing: const Text(
                            '',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
              height: 0, // Set the height to 0 to remove the divider line
              color: Colors.transparent, // Set the color to transparent
            );
                },
              );
      }),
      // child: Column(
      //   children: [
      //     ksizedbox20,
      //     Padding(
      //       padding: const EdgeInsets.only(left: 15),
      //       child: Row(
      //         children: [
      //           Text('Notifications',style: TextStyle(fontSize: 16,
      //           fontWeight: FontWeight.bold),)
      //         ],
      //       ),
      //     ),
      //     ksizedbox20,
      //     Padding(
      //       padding: const EdgeInsets.only(left: 20),
      //       child: Row(
      //         children: [
      //          Image.asset('assets/images/profile.png',height: 50,fit: BoxFit.fitHeight,),
      //          Padding(
      //            padding: const EdgeInsets.only(left: 15),
      //            child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //              children: [
      //                Text('Prakash Raj commented on ',
      //                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
      //                Text('Tamil new year post',style: TextStyle(fontSize: 12,
      //                fontWeight: FontWeight.bold),)
      //              ],
      //            ),
      //          ),
      //          Padding(
      //            padding: const EdgeInsets.only(left: 30),
      //            child: Text('2 Hours ago',style: TextStyle(
      //             fontSize: 12
      //            ),),
      //          )
      //         ],
      //       ),
      //     ),
      //     ksizedbox20,

      //   ],
      // ),
    );
  }
}
