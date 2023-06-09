import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/models/friend_list_model.dart';

import '../../../../../data/components/controllers/profile_controller.dart';
import '../../../profile/views/profile_pagee.dart';
import 'friend_reques_widgets.dart';

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
  super.initState();
  profileController. getMyFriendRequestList();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // profileController.getProfile();
    profileController.getMyFriendList();
    profileController.getMyFriendRequestList();
  }
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
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [
                Text(
                  'Friends',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _friendsindex = 0;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 90,
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
                      'Your Friends',
                      style: TextStyle(
                          fontSize: 12.5,
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
                    height: 30,
                    width: 90,
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
                          fontSize: 12.5,
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
                    ? const Center(
                        child: Text("No Friends"),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return profileController.myFriendList[index].status == "1" ? friendContiner(
                            friendList: profileController.myFriendList[index],
                          ):Container();
                        },
                        itemCount: profileController.myFriendList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                              height: 1,
                            ));
              }),
            ),
          if (_friendsindex == 1) GetBuilder<ProfileController>(builder: (_) {
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
                                                'assets/images/img.jpg'),
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
   friendContiner({
    super.key,
    required this.friendList
  });

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
            Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.fitHeight,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.friendList.name,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'HR community',
                    style: TextStyle(fontSize: 11),
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
