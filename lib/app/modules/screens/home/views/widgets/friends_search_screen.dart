import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/data/components/search_field.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
//import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
//import '../constands.dart';
class FriendsSearch extends StatefulWidget {
  const FriendsSearch({super.key});

  @override
  State<FriendsSearch> createState() => _FriendsSearchState();
}

class _FriendsSearchState extends State<FriendsSearch> {
  bool _isfavorite = false;
  bool _isfavorite2 = false;
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
    return GetBuilder<ProfileController>(builder: (_) {
      return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
        decoration: BoxDecoration(
            color: kwhite,
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ksizedbox30,
            Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              )
            ]),
            ksizedbox30,
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: kwhite.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: kgrey,
                            blurRadius: 1.5,
                            offset: const Offset(0.0, 0.75))
                      ]),
                  child: TextField(
                    controller: searchtextController,
                    decoration: InputDecoration(
                        errorBorder: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(fontSize: 14),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        )),
                  )),
            ),
            ksizedbox30,
            Container(
            //  height: 400,
              width:    MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 20),
                child: profileController.searchFriendsList.isEmpty
                    ? Center(
                        child: Text("Search New Friends").text.xl.semiBold.make(),
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
                                                .searchFriendsList[index]
                                                .profile ==
                                            null
                                        ? const CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                                'assets/images/propic.jpg'),
                                          )
                                        : CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                profileController
                                                    .searchFriendsList[index]
                                                    .profile),
                                          ),
                                    title: Text(profileController
                                        .searchFriendsList[index].name),
                                    subtitle: Text(profileController
                                            .searchFriendsList[index]
                                            .designation ??
                                        ""),
                                  ),
                                  if (profileController
                                          .searchFriendsList[index].isFriend ==
                                      false)
                                    Positioned(
                                      bottom: 15,
                                      right: 6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print(
                                                  "<.....adding friend request.......${profileController.searchFriendsList[index].friendId.toString()}...........>>>");
                                              profileController.sendRequest(
                                                  userId: profileController
                                                      .searchFriendsList[index]
                                                      .friendId
                                                      .toString(),
                                                  index: index);
                                              print(
                                                  "<.....ending <<<<<>>>>>> adding friend request..................>>>");
                                            },
                                            child: Container(
                                              child: Center(
                                                  child: Text(
                                                "Add Friend",
                                                style: TextStyle(
                                                    color: kwhite,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
