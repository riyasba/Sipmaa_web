import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../data/components/constands/constands.dart';
import '../../../data/components/controllers/profile_controller.dart';
import '../../../data/models/widgets/search_field.dart';

class SearchFriends extends StatefulWidget {
  const SearchFriends({super.key});

  @override
  State<SearchFriends> createState() => _SearchFriendsState();
}

class _SearchFriendsState extends State<SearchFriends> {
  var searchtextController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    searchtextController.addListener(searchUsers);
  }

  searchUsers() {
    if (searchtextController.text.isNotEmpty) {
      profileController.searchUser(searchtextController.text);
    } else {
      profileController.searchFriendsList.clear();
      profileController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kblue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Search'),
        actions: [],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: search(
                textController: searchtextController,
              )),
        ),
      ),
      backgroundColor: kwhite,
      body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.searchFriendsList.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: profileController.searchFriendsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.to(()=> Pub)
                    },
                    child: Card(
                      child: Stack(
                        children: [
                          ListTile(
                            leading: profileController
                                        .searchFriendsList[index].profile ==
                                    null
                                ? const CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage('assets/icons/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        profileController
                                            .searchFriendsList[index].profile),
                                  ),
                            title: Text(profileController
                                    .searchFriendsList[index].name)
                                ,
                            subtitle: Text(profileController
                                        .searchFriendsList[index].designation ??
                                    "")
                                ,
                          ),
                          if (profileController
                                  .searchFriendsList[index].isFriend ==
                              false)
                            Positioned(
                              bottom: 15,
                              right: 6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      profileController.sendRequest(
                                          userId: profileController
                                              .searchFriendsList[index].friendId
                                              .toString(),
                                          index: index);
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        "Add Friend",
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
                                  // ksizedbox10,
                                  // Container(
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
                                  //       border: Border.all(color: kblue, width: 1),
                                  //       borderRadius: BorderRadius.circular(17),
                                  //       color: kwhite),
                                  // ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
