import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/models/friend_list_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../data/components/controllers/profile_controller.dart';
import '../../../../../respohome/friendsprofile/friendsrespoprofile.dart';

class HomeFriendsWidget extends StatefulWidget {
  const HomeFriendsWidget({super.key});

  @override
  State<HomeFriendsWidget> createState() => _HomeFriendsWidgetState();
}

class _HomeFriendsWidgetState extends State<HomeFriendsWidget> {
  final profileController = Get.find<ProfileController>();
  int _friendsindex = 0;
  bool _accept = false;
  bool _remove = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // profileController.getProfile();
    profileController.getMyFriendList();
    profileController.getMyFriendRequestList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.23,
      decoration: BoxDecoration(
          color: kwhite,
          boxShadow: <BoxShadow>[
            BoxShadow(offset: Offset(0.0, 0.75), blurRadius: 0.5, color: kgrey)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: [
                Text(
                  'My Connections',
                )
                    .text
                    .semiBold
                    .xl2
                    .fontFamily(GoogleFonts.poppins().fontFamily!)
                    .make(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _friendsindex = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                        color: _friendsindex == 0 ? kblue : kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              color: kgrey,
                              blurRadius: 0.5)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Your Connections',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: _friendsindex == 0 ? kwhite : Colors.black),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _friendsindex = 1;
                    });
                    profileController.getMyFriendRequestList();
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: _friendsindex == 1 ? kblue : kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              color: kgrey,
                              blurRadius: 0.5)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Request',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: _friendsindex == 1 ? kwhite : Colors.black),
                    )),
                  ),
                ),
              ],
            ),
          ),
          if (_friendsindex == 0)
            Container(
              width: size.width * 0.7,
              height: size.height * 0.7,
              child: GetBuilder<ProfileController>(builder: (_) {
                return profileController.myFriendList.isEmpty
                    ? Center(
                        child: Text("No Friends").text.semiBold.xl.make(),
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
                                     Get.offAll(() => RespoFriendsProfile(
                                                                userId:  profileController
                                            .myFriendList[i].friendId,
                                                              ));
                                    // final myprofileController =
                                    //     Get.find<ProfileController>();
                                    // String tchatId = "";

                                    // if (profileController
                                    //         .myFriendList[i].friendId >
                                    //     myprofileController
                                    //         .profileData.first.user.id) {
                                    //   tchatId =
                                    //       "chatId${profileController.myFriendList[i].friendId}0${myprofileController.profileData.first.user.id}";
                                    // } else {
                                    //   tchatId =
                                    //       "chatId${myprofileController.profileData.first.user.id}0${profileController.myFriendList[i].friendId}";
                                    // }
                                    // ChatListModel chatListModel = ChatListModel(
                                    //     userId: profileController
                                    //         .myFriendList[i].friendId,
                                    //     firstName: profileController
                                    //         .myFriendList[i].name,
                                    //     lastName: "",
                                    //     photo: profileController
                                    //         .myFriendList[i].profile,
                                    //     pin: 0,
                                    //     isArchived: false,
                                    //     isBlocked: false,
                                    //     isMuted: false,
                                    //     userName: "",
                                    //     chatId: tchatId,
                                    //     message: "",
                                    //     messageType: MessageType().text,
                                    //     unreadCount: 1,
                                    //     readStatus: false,
                                    //     createdAt: DateTime.now()
                                    //         .millisecondsSinceEpoch
                                    //         .toString(),
                                    //     updatedAt: DateTime.now()
                                    //         .millisecondsSinceEpoch
                                    //         .toString(),
                                    //     users: [
                                    //       myprofileController
                                    //           .profileData.first.user.id
                                    //     ]);

                                    // Get.to(() => ViewMessageScreenRespo(
                                    //       chatModel: chatListModel,
                                    //       peerId: profileController
                                    //           .myFriendList[i].friendId,
                                    //     ));
                                  },
                                  child: friendContiner(
                                    friendList:
                                        profileController.myFriendList[i],
                                  ),
                                )
                          ],
                        ),
                      );
              }),
            ),
          if (_friendsindex == 1)
            Container(
              width: size.width * 0.7,
              height: size.height * 0.7,
              child: GetBuilder<ProfileController>(
                builder: (_) {
                  return profileController.friendRequestList.isEmpty
                      ? Center(
                          child: Text("No Requests").text.semiBold.xl.make(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        profileController
                                                    .friendRequestList[index]
                                                    .profile ==
                                                null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile_icon.png'),
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: NetworkImage(
                                                      profileController
                                                          .friendRequestList[
                                                              index]
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
                                                    .friendRequestList[index]
                                                    .name,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                    .friendRequestList[index]
                                                    .friendId
                                                    .toString(),
                                                status: "1");
                                          },
                                          child: Icon(Icons.done),
                                          // child: Container(
                                          //   child: Center(
                                          //       child: Text(
                                          //     "Accept",
                                          //     style: TextStyle(
                                          //         color: kwhite,
                                          //         fontWeight: FontWeight.w600),
                                          //   )),
                                          //   height: 30,
                                          //   width: 80,
                                          //   decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(17),
                                          //       color: kblue),
                                          // ),
                                        ),
                                        kwidth10,
                                        ksizedbox10,
                                        InkWell(
                                          onTap: () {
                                            profileController.respondRequest(
                                                userId: profileController
                                                    .friendRequestList[index]
                                                    .friendId
                                                    .toString(),
                                                status: "2");
                                          },
                                          child: Icon(Icons.close),
                                          // child: Container(
                                          //   child: Center(
                                          //       child: Text(
                                          //     "Remove",
                                          //     style: TextStyle(
                                          //         color: kblue,
                                          //         fontWeight: FontWeight.w600),
                                          //   )),
                                          //   height: 30,
                                          //   width: 80,
                                          //   decoration: BoxDecoration(
                                          //       border: Border.all(
                                          //           color: kblue, width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(17),
                                          //       color: kwhite),
                                          // ),
                                        ),
                                        kwidth10,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          // Container(
          //   width: size.width * 0.7,
          //   height: size.height * 0.7,
          //   child: ListView.separated(
          //     itemBuilder: (context, index) => FriendRequesWiget(),
          //     itemCount: 4,
          //     separatorBuilder: (context, index) => Divider(
          //       height: 1,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class friendContiner extends StatefulWidget {
  FriendList friendList;
  friendContiner({super.key, required this.friendList});

  @override
  State<friendContiner> createState() => _friendContinerState();
}

class _friendContinerState extends State<friendContiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Row(
          children: [
            widget.friendList.profile == ""
                ? const CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundImage:
                         AssetImage('assets/images/propic.jpg'),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(widget.friendList.profile),
                  ),
            // Image.asset(
            //   'assets/images/profile.png',
            //   fit: BoxFit.fitHeight,
            //   height: 30,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.friendList.name,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    widget.friendList.designation,
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
