import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/search_field.dart';
import 'package:reg_login/app/data/models/comment_list_model.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/continers/comentcontiner.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/likepost.dart';

import '../../../../data/components/controllers/auth_controllers.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import '../../../../data/components/controllers/profile_controller.dart';
import '../../profile/views/profile_pagee.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeContainer extends StatefulWidget {
  HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  bool _isfavorite = false;
  bool _isfavorite2 = false;
  final postsController = Get.find<PostsController>();
  final authController = Get.find<AuthController>();
  //final profileController = Get.find<ProfileController>();
  var commentController = TextEditingController();
  var dialogeController = TextEditingController();
  var commentTextController = TextEditingController();
  final postController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      child: GetBuilder<PostsController>(builder: (_) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
          shrinkWrap: true,
          itemCount: postsController.allPostList.length,
          itemBuilder: (context, index) {
            return Container(
              //   height: MediaQuery.of(context).size.height * 0.88,
              width: MediaQuery.of(context).size.width * 0.38,
              decoration: BoxDecoration(
                  color: kwhite,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            postsController.allPostList[index].user
                                        .profilePicture ==
                                    null
                                ? const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/icons/profile_icon.png'),
                                    radius: 25,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        postsController.allPostList[index].user
                                            .profilePicture),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postsController.allPostList[index].user.name,
                                  style: ktextstyle22,
                                ),
                                Text(postsController
                                        .allPostList[index].user.designation ??
                                    postsController
                                        .allPostList[index].user.userName)
                              ],
                            ),
                          ],
                        ),
                        Text(
                          timeago.format(
                              postsController.allPostList[index].createdAt),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  ksizedbox30,
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 5),
                    child: Row(
                      children: [
                        Text(
                          postsController.allPostList[index].title,
                          style: const TextStyle(
                              fontSize: 18.5, fontWeight: FontWeight.w500),
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
                        child: Image.network(
                          postsController.allPostList[index].body.toString(),
                          fit: BoxFit.cover,
                          width: size.width * 0.3,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  postController.getLikesList(
                                      postId: postsController
                                          .allPostList[index].id
                                          .toString());
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                              // decoration: BoxDecoration(),
                                              height: 440,
                                              width: 290,
                                              child: Column(
                                                children: [
                                                  ksizedbox10,
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          icon: const Icon(Icons
                                                              .arrow_back)),
                                                     const Text(
                                                        'Reactions',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      )
                                                    ],
                                                  ),
                                                  ksizedbox10,
                                                  GetBuilder<PostsController>(
                                                      builder: (_) {
                                                    return Container(
                                                      height: 350,
                                                      width: 290,
                                                      child: postController
                                                              .likesList.isEmpty
                                                          ? const Center(
                                                              child: Text(
                                                                  "No Likes Yet!"),
                                                            )
                                                          : ListView.separated(
                                                              physics:
                                                                  BouncingScrollPhysics(),
                                                              itemCount:
                                                                  postController
                                                                      .likesList
                                                                      .length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return GestureDetector(
                                                                  onTap: () {},
                                                                  child: ListTile(
                                                                      leading: postController.likesList[index].picture == ""
                                                                          ? const CircleAvatar(
                                                                              radius: 40,
                                                                              backgroundImage: AssetImage('assets/images/createprofile.png'),
                                                                            )
                                                                          : CircleAvatar(
                                                                              radius: 40,
                                                                              backgroundImage: NetworkImage(postController.likesList[index].picture),
                                                                            ),
                                                                      title: Text(postController.likesList[index].userName),
                                                                      subtitle: Text(postController.likesList[index].userName),
                                                                      trailing: Text(
                                                                        timeago.format(postController
                                                                            .likesList[index]
                                                                            .createdAt),
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                10),
                                                                      )),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return const Divider(
                                                                  height: 1,
                                                                );
                                                              },
                                                            ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 15,
                                )),
                            Text(
                              postsController.allPostList[index].likeCount
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                              onTap: () {
                                postController.getComments(
                                    postId: postsController
                                        .allPostList[index].id
                                        .toString());

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 110),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 350,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.53,
                                              decoration:
                                                  BoxDecoration(color: kwhite),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Row(
                                                      children: [
                                                        Image.network(
                                                          postsController
                                                              .allPostList[
                                                                  index]
                                                              .body,
                                                          fit: BoxFit.contain,
                                                          width:
                                                              size.width * 0.3,
                                                          height:
                                                              size.height * 0.4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 35, left: 20),
                                                    child: Container(
                                                      height: 300,
                                                      width: 250,
                                                      child: GetBuilder<
                                                              PostsController>(
                                                          builder: (_) {
                                                        return postsController
                                                                .commentsList
                                                                .isEmpty
                                                            ? const Center(
                                                                child: Text(
                                                                    "No Comments Yet!"),
                                                              )
                                                            : ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemBuilder: (context,
                                                                        index) =>
                                                                    comentsContainer(
                                                                  commentsList:
                                                                      postsController
                                                                              .commentsList[
                                                                          index],
                                                                ),
                                                                itemCount:
                                                                    postsController
                                                                        .commentsList
                                                                        .length,
                                                              );
                                                      }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                '${postsController.allPostList[index].comment} Comments'
                                    .toString(),
                                //   '${postsController.allPostList[index].comment} comments',
                                //   postsController
                                //                          .allPostList[index]
                                //                           .likeCount
                                //                          .toString(),
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        LikeButton(
                          isliked:
                              postsController.allPostList[index].likedByUser,
                          postId: postsController.allPostList[index].id,
                          indexOfPost: index,
                        ),
                        InkWell(
                          onTap: () {
                            postController.getComments(
                                postId: postsController.allPostList[index].id
                                    .toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Icon(Icons.comment_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                  ksizedbox30,
                  Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //           blurRadius: 5,
                      //           color: Colors.grey.withOpacity(0.5)),
                      //     ],
                      //   ),
                      //   height: 60,
                      //   width: 333,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 10, right: 10),
                      //     child:
                      //     postController.profileData.isEmpty
                      //         ? Container(
                      //             width: 5,
                      //           )
                      //        :
                      //          Container(
                      //           width: 222,
                      //            child: Row(
                      //             children: [
                      //               postController
                      //                           .profileData.first.profilePicture ==
                      //                       null
                      //                   ? const CircleAvatar(
                      //                       backgroundImage: AssetImage(
                      //                           'assets/images/Group 89.png'),
                      //                     )
                      //                   : CircleAvatar(
                      //                       backgroundImage: NetworkImage(
                      //                           postController.profileData.first
                      //                               .profilePicture),
                      //                     ),
                      //               const SizedBox(width: 10),
                      //               Expanded(
                      //                 child: TextField(
                      //                     controller: commentTextController,
                      //                     decoration:
                      //                         const InputDecoration.collapsed(
                      //                             hintText: "Add a comments")),
                      //               ),
                      //               const SizedBox(width: 10),
                      //               InkWell(
                      // onTap: () {
                      //   if (commentTextController
                      //       .text.isNotEmpty) {
                      //     postController.postComments(
                      //         userID: postController
                      //             .profileData.first.id
                      //             .toString(),
                      //         postId: postsController
                      //             .allPostList[index].id
                      //             .toString(),
                      //         comment:
                      //             commentTextController.text);
                      //     commentTextController.clear();
                      //   } else {
                      //     Get.rawSnackbar(
                      //       messageText: const Text(
                      //         "type anything before commenting",
                      //         style:
                      //             TextStyle(color: Colors.white),
                      //       ),
                      //       backgroundColor: Colors.red,
                      //     );
                      //   }
                      // },
                      //                   child: Icon(Icons.send)),
                      //             ]),
                      //          ),
                      //   ),
                      // ),
                      child: GetBuilder<ProfileController>(builder: (_) {
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.80),
                                      color: kgrey.withOpacity(0.4),
                                      blurRadius: 0.2)
                                ]),
                            height: 42,
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: postsController
                                  .allPostList[index].textEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      print(postsController.allPostList[index]
                                          .textEditingController.text);
                                      if (postsController
                                          .allPostList[index]
                                          .textEditingController
                                          .text
                                          .isNotEmpty) {
                                        postController.postComments(
                                            index: index,
                                            userID: profileController
                                                .profileData.first.user.id
                                                .toString(),
                                            postId: postsController
                                                .allPostList[index].id
                                                .toString(),
                                            comment: postsController
                                                .allPostList[index]
                                                .textEditingController
                                                .text);
                                        postsController.allPostList[index]
                                            .textEditingController
                                            .clear();
                                        postController.update();
                                      } else {
                                        Get.rawSnackbar(
                                          messageText: const Text(
                                            "type anything before commenting",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red,
                                        );
                                      }
                                    },
                                    child: Icon(Icons.send)),
                                hintText: 'Write Comment',
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                prefixIcon: profileController
                                        .profileData.isEmpty
                                    ? Container(
                                        width: 5,
                                        height: 10,
                                        color: Colors.red,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Container(
                                          width: 20,
                                          child: Row(children: [
                                            profileController.profileData.first
                                                        .user.profilePicture ==
                                                    null
                                                ? const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/images/createprofile.png'),
                                                  )
                                                : CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                            profileController
                                                                .profileData
                                                                .first
                                                                .user
                                                                .profilePicture),
                                                  ),
                                          ]),
                                        ),
                                      ),
                              ),
                            ));
                      })),
                  ksizedbox20,
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
