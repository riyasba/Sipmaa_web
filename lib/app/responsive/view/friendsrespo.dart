import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

//import '../widgets/appbar_friends.dart';
import '../../data/components/constands/constands.dart';

import '../../data/components/constands/message_types.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../data/models/chat_models.dart';
import '../../modules/screens/home/views/widgets/friends_widget.dart';
import '../widgets/chat_view/view_message_screen.dart';
import '../widgets/comonmobappbar.dart';
import '../widgets/drawer.dart';

class Friends_screen extends StatefulWidget {
  Friends_screen({super.key});

  @override
  State<Friends_screen> createState() => _Friends_screenState();
}

class _Friends_screenState extends State<Friends_screen> {
  int index = 0;

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    profileController.getMyFriendList();
    profileController.getMyFriendRequestList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kwhite,
        drawer: MobileDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(240),
          child: Column(
            children: [
              ComenappBarmob(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GetBuilder<ProfileController>(builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Friends',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          profileController.profileData.isNotEmpty
                              ? Text(
                                  '${profileController.profileData.first.totalFriends} friends',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              ksizedbox10,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  height: 0,
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              ksizedbox10,
              TabBar(
                  automaticIndicatorColorAdjustment: true,
                  //  isScrollable: true,
                  labelColor: kwhite,
                  padding: EdgeInsets.only(right: 15, left: 15),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: kblue),
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });

                    if (index == 0) {
                      profileController.getMyFriendList();
                    } else {
                      profileController.getMyFriendRequestList();
                    }
                  },
                  tabs: [
                    Tab(
                      text: "Your Friend",
                    ),
                    // Tab(
                    //   text: "Friend Request",
                    // ),
                    Tab(
                      text: "Request",
                    )
                  ]),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            width: size.width * 0.7,
            height: size.height * 0.7,
            child: GetBuilder<ProfileController>(builder: (_) {
              return profileController.myFriendList.isEmpty
                  ? const Center(
                      child: Text("No Friends"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0;
                              i < profileController.myFriendList.length;
                              i++)
                            if (profileController.myFriendList[i].status
                                    .toString() ==
                                "1")
                              InkWell(
                                onTap: () {
                                  final myprofileController =
                                      Get.find<ProfileController>();
                                  String tchatId = "";

                                  if (profileController
                                          .myFriendList[i].friendId >
                                      myprofileController
                                          .profileData.first.user.id) {
                                    tchatId =
                                        "chatId${profileController.myFriendList[i].friendId}0${myprofileController.profileData.first.user.id}";
                                  } else {
                                    tchatId =
                                        "chatId${myprofileController.profileData.first.user.id}0${profileController.myFriendList[i].friendId}";
                                  }
                                  ChatListModel chatListModel = ChatListModel(
                                      userId: profileController
                                          .myFriendList[i].friendId,
                                      firstName: profileController
                                          .myFriendList[i].name,
                                      lastName: "",
                                      photo: profileController
                                          .myFriendList[i].profile,
                                      pin: 0,
                                      isArchived: false,
                                      isBlocked: false,
                                      isMuted: false,
                                      userName: "",
                                      chatId: tchatId,
                                      message: "",
                                      messageType: MessageType().text,
                                      unreadCount: 1,
                                      readStatus: false,
                                      createdAt: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      updatedAt: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      users: [
                                        myprofileController
                                            .profileData.first.user.id
                                      ]);

                                  Get.to(() => ViewMessageScreen(
                                        chatModel: chatListModel,
                                        peerId: profileController
                                            .myFriendList[i].friendId,
                                      ));
                                },
                                child: friendContiner(
                                  friendList: profileController.myFriendList[i],
                                ),
                              )
                        ],
                      ),
                    );
            }),
          ),

          // GetBuilder<ProfileController>(builder: (_) {
          //   return profileController.myFriendList.isEmpty
          //       ? const Center(
          //           child: Text("No Friends"),
          //         )
          //       : Container(width: 100,height: 300,
          //         child: ListView.builder(
          //             shrinkWrap: true,
          //             physics: const BouncingScrollPhysics(),
          //             itemCount: profileController.myFriendList.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return profileController.myFriendList[index].status == "1"
          //                   ? GestureDetector(
          //                       onTap: () {
          //                         final myprofileController =
          //                             Get.find<ProfileController>();
          //                         String tchatId = "";

          //                         if (profileController
          //                                 .myFriendList[index].friendId >
          //                             myprofileController
          //                                 .profileData.first.user.id) {
          //                           tchatId =
          //                               "chatId${profileController.myFriendList[index].friendId}0${myprofileController.profileData.first.user.id}";
          //                         } else {
          //                           tchatId =
          //                               "chatId${myprofileController.profileData.first.user.id}0${profileController.myFriendList[index].friendId}";
          //                         }
          //                         ChatListModel chatListModel = ChatListModel(
          //                             userId: profileController
          //                                 .myFriendList[index].friendId,
          //                             firstName: profileController
          //                                 .myFriendList[index].name,
          //                             lastName: "",
          //                             photo: profileController
          //                                 .myFriendList[index].profile,
          //                             pin: 0,
          //                             isArchived: false,
          //                             isBlocked: false,
          //                             isMuted: false,
          //                             userName: "",
          //                             chatId: tchatId,
          //                             message: "",
          //                             messageType: MessageType().text,
          //                             unreadCount: 1,
          //                             readStatus: false,
          //                             createdAt: DateTime.now()
          //                                 .millisecondsSinceEpoch
          //                                 .toString(),
          //                             updatedAt: DateTime.now()
          //                                 .millisecondsSinceEpoch
          //                                 .toString(),
          //                             users: [
          //                               myprofileController
          //                                   .profileData.first.user.id
          //                             ]);

          //                         Get.to(() => ViewMessageScreen(
          //                               chatModel: chatListModel,
          //                               peerId: profileController
          //                                   .myFriendList[index].friendId,
          //                             ));
          //                       },
          //                       child: Card(
          //                         child: ListTile(
          //                           leading: profileController
          //                                       .myFriendList[index].profile ==
          //                                   null
          //                               ? const CircleAvatar(
          //                                   radius: 40,
          //                                   backgroundImage: AssetImage(
          //                                       'assets/images/profile_icon.png'),
          //                                 )
          //                               : CircleAvatar(
          //                                   radius: 40,
          //                                   backgroundImage: NetworkImage(
          //                                       profileController
          //                                           .myFriendList[index].profile),
          //                                 ),
          //                           title: Text(profileController
          //                               .myFriendList[index].name),
          //                           subtitle: Text(profileController
          //                               .myFriendList[index].designation),
          //                         ),
          //                       ),
          //                     )
          //                   : Container();
          //             },
          //           ),
          //       );
          // }),

////////////////////

          // GetBuilder<ProfileController>(builder: (_) {
          //   return profileController.myFriendList.isEmpty
          //       ? const Center(
          //           child: Text("No Friends"),
          //         )
          //       : Text(profileController.myFriendList.first.name,style: primaryfont.copyWith(color: Colors.blue),);
          // }),
          // Center(
          //   child: friendrequest(
          //     text1: 'Add Friend',
          //     text2: 'Delete',
          //   ),
          // ),
          GetBuilder<ProfileController>(builder: (_) {
            return profileController.friendRequestList.isEmpty
                ? const Center(
                    child: Text("No Requests"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: profileController.friendRequestList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  profileController.friendRequestList[index]
                                              .profile ==
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile_icon.png'),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                profileController
                                                    .friendRequestList[index]
                                                    .profile),
                                          ),
                                        ),
                                  Container(
                                    width: 110,
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profileController
                                              .friendRequestList[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          profileController
                                              .friendRequestList[index]
                                              .designation,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      profileController.respondRequest(
                                          userId: profileController
                                              .friendRequestList[index].friendId
                                              .toString(),
                                          status: "1");
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        "Accept",
                                        style: TextStyle(
                                            color: kwhite,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: kblue),
                                    ),
                                  ),
                                  kwidth10,
                                  ksizedbox10,
                                  InkWell(
                                    onTap: () {
                                      profileController.respondRequest(
                                          userId: profileController
                                              .friendRequestList[index].friendId
                                              .toString(),
                                          status: "2");
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        "Remove",
                                        style: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kblue, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          })
        ]),
      ),
    );
  }
}
