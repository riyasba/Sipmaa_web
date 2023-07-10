import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/responsive/view/reactions_page.dart';

import 'package:timeago/timeago.dart' as timeago;
import '../../modules/screens/home/views/widgets/likepost.dart';
import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/auth_controllers.dart';
import '../../data/components/controllers/posts_controller.dart';

import '../widgets/drawer.dart';
import 'coments.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _allTap = false;
  bool _hrTap = false;
  bool _salesTap = false;
  bool _marketTap = false;
  bool _addTap = false;

  final authController = Get.find<AuthController>();
  final postsController = Get.find<PostsController>();

  @override
  void initState() {
    super.initState();
    authController.getDepartmentList();
    postsController.getAllInFilterPost();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(125),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: kblue,
              title: const Text(
                'Filter',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 45,
              child: GetBuilder<AuthController>(builder: (_) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    authController.selctedIndex.value == 100
                                        ? Color(0xff3C73B1)
                                        : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              // setState(() {
                              //   _salesTap = !_salesTap;
                              // });
                              postsController.getAllInFilterPost();
                              authController.selctedIndex(100);
                              authController.update();
                            },
                            child: Text(
                              "All",
                              style: TextStyle(
                                  color:
                                      authController.selctedIndex.value == 100
                                          ? kwhite
                                          : Colors.black),
                            )),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: authController.departments.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          authController.selctedIndex.value ==
                                                  index
                                              ? Color(0xff3C73B1)
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    // setState(() {
                                    //   _salesTap = !_salesTap;
                                    // });
                                    postsController.filterPosts(
                                        departmentId: authController
                                            .departments[index].id);
                                    authController.selctedIndex(index);
                                    authController.update();
                                  },
                                  child: Text(
                                    authController.departments[index].title,
                                    style: TextStyle(
                                        color:
                                            authController.selctedIndex.value ==
                                                    index
                                                ? kwhite
                                                : Colors.black),
                                  )),
                            );
                          }),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      //drawer: MobileDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GetBuilder<PostsController>(builder: (_) {
          return postsController.filterList.isEmpty
              ? Center(child: Text(''))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10),
                    shrinkWrap: true,
                    itemCount: postsController.filterList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //  height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.38,
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.7),
                                  blurRadius: 0.5,
                                  color: kgrey)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              ksizedbox10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      postsController.filterList[index].user
                                                  .profilePicture ==
                                              null
                                          ? const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/icons/profile_icon.png'),
                                              radius: 25,
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  postsController
                                                      .filterList[index]
                                                      .user
                                                      .profilePicture),
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            postsController
                                                .filterList[index].user.name,
                                            style: ktextstyle22,
                                          ),
                                          Text(postsController.filterList[index]
                                                  .user.designation ??
                                              postsController.filterList[index]
                                                  .user.userName)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    timeago.format(postsController
                                        .filterList[index].createdAt),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              ksizedbox30,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      postsController.filterList[index].title,
                                      style: TextStyle(fontSize: 18.5),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox30,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: postsController.filterList.isEmpty
                                        ? Center(child: Text(''))
                                        : Image.network(
                                            postsController
                                                .filterList[index].body
                                                .toString(),
                                            fit: BoxFit.cover,
                                            width: size.width * 0.8,
                                            height: size.height * 0.4,
                                          ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              postsController.getLikesList(
                                                  postId: postsController
                                                      .filterList[index].id
                                                      .toString());
                                            },
                                            icon: InkWell(
                                              onTap: () {
                                                Get.to(reacton_screen(
                                                  likeCount: postsController
                                                      .filterList[index]
                                                      .likeCount,
                                                  postId: postsController
                                                      .filterList[index].id,
                                                ));
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.pink,
                                                size: 15,
                                              ),
                                            )),
                                        Text(postsController
                                            .filterList[index].likeCount
                                            .toString())
                                        //                             Text(
                                        // //postsController.filterList[index].likeCount
                                        //   //                                .toString(),
                                        //                               style: TextStyle(
                                        //                                   fontSize: 13, fontWeight: FontWeight.w800),
                                        //                             ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: InkWell(
                                          onTap: () {
                                            Get.to(coments(
                                              postId: postsController
                                                  .filterList[index].id,
                                            ));
                                          },
                                          child: Text(
                                            '${postsController.filterList[index].comment} comments',
                                          )),
                                      // child: InkWell(
                                      //     onTap: () {
                                      //       postsController.getComments(
                                      //           postId: postsController
                                      //               .filterList[index].id
                                      //               .toString());

                                      //       // showDialog(
                                      //       //     context: context,
                                      //       //     builder: (context) {
                                      //       //       return Padding(
                                      //       //         padding:
                                      //       //             const EdgeInsets.only(left: 110),
                                      //       //         child: Row(
                                      //       //           children: [
                                      //       //             Container(
                                      //       //               height: 350,
                                      //       //               width: MediaQuery.of(context)
                                      //       //                       .size
                                      //       //                       .width *
                                      //       //                   0.7,
                                      //       //               decoration:
                                      //       //                   BoxDecoration(color: kwhite),
                                      //       //               child: Row(
                                      //       //                 children: [
                                      //       //                   Padding(
                                      //       //                     padding:
                                      //       //                         const EdgeInsets.only(
                                      //       //                             left: 15),
                                      //       //                     child: Row(
                                      //       //                       children: [
                                      //       //                         Image.network(
                                      //       //                           postsController
                                      //       //                               .filterList[
                                      //       //                                   index]
                                      //       //                               .body,
                                      //       //                           fit: BoxFit.cover,
                                      //       //                           width:
                                      //       //                               size.width * 0.3,
                                      //       //                           height:
                                      //       //                               size.height * 0.4,
                                      //       //                         ),
                                      //       //                       ],
                                      //       //                     ),
                                      //       //                   ),
                                      //       //                   Padding(
                                      //       //                     padding:
                                      //       //                         const EdgeInsets.only(
                                      //       //                             top: 35, left: 20),
                                      //       //                     child: Container(
                                      //       //                       height: 300,
                                      //       //                       width: 500,
                                      //       //                       child: GetBuilder<
                                      //       //                               PostsController>(
                                      //       //                           builder: (_) {
                                      //       //                         return ListView.builder(
                                      //       //                           shrinkWrap: true,
                                      //       //                           itemBuilder: (context,
                                      //       //                                   index) =>
                                      //       //                               comentsContainer(
                                      //       //                             commentsList:
                                      //       //                                 postsController
                                      //       //                                         .commentsList[
                                      //       //                                     index],
                                      //       //                           ),
                                      //       //                           itemCount:
                                      //       //                               postsController
                                      //       //                                   .commentsList
                                      //       //                                   .length,
                                      //       //                         );
                                      //       //                       }),
                                      //       //                     ),
                                      //       //                   ),
                                      //       //                 ],
                                      //       //               ),
                                      //       //             ),
                                      //       //           ],
                                      //       //         ),
                                      //       //       );
                                      //       //     });
                                      //     },
                                      //     child: Text(
                                      //       '${postsController.filterList[index].comment} Coments'
                                      //           .toString(),
                                      //       //   '${postsController.filterList[index].comment} comments',
                                      //       //   postsController
                                      //       //                          .filterList[index]
                                      //       //                           .likeCount
                                      //       //                          .toString(),
                                      //       style: TextStyle(fontSize: 13),
                                      //     )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    LikeButton(
                                      isliked: postsController
                                          .filterList[index].likedByUser,
                                      postId:
                                          postsController.filterList[index].id,
                                      indexOfPost: index,
                                    ),
                                    kwidth10,
                                    InkWell(
                                      onTap: () {
                                        postsController.getComments(
                                            postId: postsController
                                                .filterList[index].id
                                                .toString());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: InkWell(
                                            onTap: () {
                                              Get.to(coments(
                                                postId: postsController
                                                    .filterList[index].id,
                                              ));
                                            },
                                            child: Icon(Icons.comment_rounded)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Padding(
                              //     padding: const EdgeInsets.only(left: 30, right: 30),
                              //     child: GetBuilder<ProfileController>(builder: (_) {
                              //       return Container(
                              //           decoration: BoxDecoration(
                              //               color: Colors.white.withOpacity(0.75),
                              //               borderRadius: BorderRadius.circular(15),
                              //               boxShadow: <BoxShadow>[
                              //                 BoxShadow(
                              //                     offset: Offset(0.0, 0.80),
                              //                     color: kgrey.withOpacity(0.4),
                              //                     blurRadius: 0.2)
                              //               ]),
                              //           height: 42,
                              //           width: MediaQuery.of(context).size.width,
                              //           child: TextField(
                              //             controller: postsController
                              //                 .filterList[index].textEditingController,
                              //             decoration: InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderSide: BorderSide.none),
                              //               suffixIcon: InkWell(
                              //                   onTap: () {
                              //                     print(postsController.filterList[index]
                              //                         .textEditingController.text);
                              //                     if (postsController
                              //                         .filterList[index]
                              //                         .textEditingController
                              //                         .text
                              //                         .isNotEmpty) {
                              //                       postsController.postComments(
                              //                           index: index,
                              //                           userID: profileController
                              //                               .profileData.first.user.id
                              //                               .toString(),
                              //                           postId: postsController
                              //                               .filterList[index].id
                              //                               .toString(),
                              //                           comment: postsController
                              //                               .filterList[index]
                              //                               .textEditingController
                              //                               .text);
                              //                       postsController.filterList[index]
                              //                           .textEditingController
                              //                           .clear();
                              //                       postsController.update();
                              //                     } else {
                              //                       Get.rawSnackbar(
                              //                         messageText: const Text(
                              //                           "type anything before commenting",
                              //                           style:
                              //                               TextStyle(color: Colors.white),
                              //                         ),
                              //                         backgroundColor: Colors.red,
                              //                       );
                              //                     }
                              //                   },
                              //                   child: Icon(Icons.send)),
                              //               hintText: '  Write Comment',
                              //               hintStyle: TextStyle(
                              //                   fontSize: 12, color: Colors.black),
                              //               prefixIcon: profileController
                              //                       .profileData.isEmpty
                              //                   ? Container(
                              //                       width: 5,
                              //                       height: 10,
                              //                       color: Colors.red,
                              //                     )
                              //                   : Container(
                              //                       width: 20,
                              //                       child: Row(children: [
                              //                         profileController.profileData.first
                              //                                     .user.profilePicture ==
                              //                                 null
                              //                             ? const CircleAvatar(
                              //                                 backgroundImage: AssetImage(
                              //                                     'assets/images/Group 89.png'),
                              //                               )
                              //                             : CircleAvatar(
                              //                                 backgroundImage: NetworkImage(
                              //                                     profileController
                              //                                         .profileData
                              //                                         .first
                              //                                         .user
                              //                                         .profilePicture),
                              //                               ),
                              //                       ]),
                              //                     ),
                              //             ),
                              //           ));
                              //     }))
                              ksizedbox20
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
          // : ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: postsController.filterList.length,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Container(
          //           width: double.infinity,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(15),
          //               boxShadow: [
          //                 BoxShadow(
          //                     blurRadius: 5,
          //                     color: Colors.grey.withOpacity(0.5)),
          //               ]),
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         postsController.filterList[index].user
          //                                     .profilePicture ==
          //                                 null
          //                             ? const CircleAvatar(
          //                                 backgroundImage: AssetImage(
          //                                     'assets/icons/profile_icon.png'),
          //                                 radius: 25,
          //                               )
          //                             : CircleAvatar(
          //                                 backgroundImage: NetworkImage(
          //                                     postsController
          //                                         .filterList[index]
          //                                         .user
          //                                         .profilePicture),
          //                                 radius: 25,
          //                               ),
          //                         const SizedBox(
          //                           width: 10,
          //                         ),
          //                         Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Text(
          //                               postsController
          //                                   .filterList[index].user.name,
          //                               style: ktextstyle22,
          //                             ),
          //                             Text(postsController.filterList[index]
          //                                     .user.designation ??
          //                                 postsController.filterList[index]
          //                                     .user.userName),
          //                           ],
          //                         ),
          //                       ],
          //                     ),
          //                     Text(
          //                       timeago.format(postsController
          //                           .filterList[index].createdAt),
          //                       style: const TextStyle(fontSize: 10),
          //                     ),
          //                   ],
          //                 ),
          //                 ksizedbox10,
          //                 // Text(postsController.filterList[index].title)
          //                 //     .animate()
          //                 //     .fade()
          //                 //     .scale(),
          //                 // const SizedBox(
          //                 //   height: 5,
          //                 // ),
          //                 Text(postsController.filterList[index].title),
          //                 ksizedbox10,
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(10),
          //                   child: Image.network(
          //                     postsController.filterList[index].body
          //                         .toString(),
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 ksizedbox10,
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(left: 5, right: 5),
          //                   child: Row(
          //                     mainAxisAlignment:
          //                         MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       InkWell(
          //                           onTap: () {
          //                             Get.to(reacton_screen(
          //                               likeCount: postsController
          //                                   .filterList[index].likeCount,
          //                               postId: postsController
          //                                   .filterList[index].id,
          //                             ));
          //                           },
          //                           child: Text(postsController
          //                               .filterList[index].likeCount
          //                               .toString())),
          //                       InkWell(
          //                           onTap: () {
          //                             Get.to(coments(
          //                               postId: postsController
          //                                   .filterList[index].id,
          //                             ));
          //                           },
          //                           child: Text(
          //                             '${postsController.filterList[index].comment} comments',
          //                           ))
          //                     ],
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   height: 5,
          //                 ),
          //                 Expanded(
          //                   flex: 0,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Divider(
          //                       height: 1,
          //                       color: Colors.black,
          //                       thickness: 1,
          //                     ),
          //                   ),
          //                 ),

          //                 Row(
          //                   children: [
          //                     LikeButton(
          //                       isliked: postsController
          //                           .filterList[index].likedByUser,
          //                       postId:
          //                           postsController.filterList[index].id,
          //                       indexOfPost: index,
          //                     ),
          //                     const SizedBox(
          //                       width: 10,
          //                     ),
          //                     InkWell(
          //                       onTap: () {
          //                         postsController.commentsList.clear();
          //                         postsController.update();
          //                         Get.to(coments(
          //                           postId: postsController
          //                               .filterList[index].id,
          //                         ));
          //                       },
          //                       //   child: kcomentbutton,
          //                     ),
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     });
        }),
      ),
    );
  }
}
