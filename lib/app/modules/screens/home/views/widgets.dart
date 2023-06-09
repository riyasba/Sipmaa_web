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
          separatorBuilder: (BuildContext context, int i) {
            return Divider(
              height: 10,
            );
          },
          shrinkWrap: true,
          itemCount: postsController.allPostList.length,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.88,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          postsController
                                      .allPostList[index].user.profilePicture ==
                                  null
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/icons/profile_icon.png'),
                                  radius: 25,
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(postsController
                                      .allPostList[index].user.profilePicture),
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
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     ksizedbox10,
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Row(children: [
                  //       Image.asset(
                  //         'assets/images/profile.png',
                  //         fit: BoxFit.fitHeight,
                  //         height: 80,
                  //       )
                  //     ]),
                  //     ksizedbox10,
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Sharmila',
                  //             style: TextStyle(
                  //                 fontSize: 17,
                  //                 fontWeight: FontWeight.w900,
                  //                 color: Colors.black),
                  //           ),
                  //           Text(
                  //             'Loream ipounum',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //             ),
                  //             textAlign: TextAlign.start,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 180),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Text('2 days ago'),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  ksizedbox30,
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 5),
                    child: Row(
                      children: [
                        Text(
                          postsController.allPostList[index].title,
                          style: TextStyle(fontSize: 18.5),
                        )
                      ],
                    ),
                  ),
                  ksizedbox30,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        postsController.allPostList[index].body.toString(),
                        fit: BoxFit.cover,
                        width: size.width * 0.3,
                        height: size.height * 0.4,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 70, bottom: 50),
                                            child: Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Container(
                                                decoration: BoxDecoration(),
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
                                                            icon: Icon(Icons
                                                                .arrow_back)),
                                                        Text(
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
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Image.asset(
                                                            'assets/images/profile.png',
                                                            height: 50,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Krishna',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  'Like in a post',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 90),
                                                          child: Text(
                                                            '2 Hours ago',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Image.asset(
                                                            'assets/images/profile.png',
                                                            height: 50,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Krishna',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  'Like in a post',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 90),
                                                          child: Text(
                                                            '2 Hours ago',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Image.asset(
                                                            'assets/images/profile.png',
                                                            height: 50,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Krishna',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  'Like in a post',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 90),
                                                          child: Text(
                                                            '2 Hours ago',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Image.asset(
                                                            'assets/images/profile.png',
                                                            height: 50,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Krishna',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  'Like in a post',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 90),
                                                          child: Text(
                                                            '2 Hours ago',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Image.asset(
                                                            'assets/images/profile.png.',
                                                            height: 50,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Krishna',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  'Like in a post',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 90),
                                                          child: Text(
                                                            '2 Hours ago',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
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
                                                  0.7,
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
                                                          fit: BoxFit.cover,
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
                                                      width: 500,
                                                      child: GetBuilder<
                                                              PostsController>(
                                                          builder: (context) {
                                                        return ListView.builder(
                                                          shrinkWrap: true,
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
                                '${postsController.allPostList[index].comment} comments',
                                //   postsController
                                //                          .allPostList[index]
                                //                           .likeCount
                                //                          .toString(),
                                style: TextStyle(fontSize: 13),
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
                        // IconButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         _isfavorite = !_isfavorite;
                        //       });
                        //     },
                        //     icon: _isfavorite == true
                        //         ? Icon(
                        //             Icons.favorite,
                        //             color: Colors.pink,
                        //           )
                        //         : Icon(Icons.favorite_border)),
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
                    //   width: double.infinity,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 10, right: 10),
                    //     child: postController.profileData.isEmpty
                    //         ? Container(
                    //             width: 5,
                    //           )
                    //         : Row(children: [
                    //             postController
                    //                         .profileData.first.profilePicture ==
                    //                     null
                    //                 ? const CircleAvatar(
                    //                     backgroundImage: AssetImage(
                    //                         'assets/images/Group 89.png'),
                    //                   )
                    //                 : CircleAvatar(
                    //                     backgroundImage: NetworkImage(
                    //                         postController.profileData.first
                    //                             .profilePicture),
                    //                   ),
                    //             const SizedBox(width: 10),
                    //             Expanded(
                    //               child: TextField(
                    //                   controller: commentTextController,
                    //                   decoration:
                    //                       const InputDecoration.collapsed(
                    //                           hintText: "Add a comments")),
                    //             ),
                    //             const SizedBox(width: 10),
                    //             InkWell(
                    //                 onTap: () {
                    //                   if (commentTextController
                    //                       .text.isNotEmpty) {
                    //                     postController.postComments(
                    //                         userID: postController
                    //                             .profileData.first.id
                    //                             .toString(),
                    //                         postId: postsController
                    //                             .allPostList[index].id
                    //                             .toString(),
                    //                         comment:
                    //                             commentTextController.text);
                    //                     commentTextController.clear();
                    //                   } else {
                    //                     Get.rawSnackbar(
                    //                       messageText: const Text(
                    //                         "type anything before commenting",
                    //                         style:
                    //                             TextStyle(color: Colors.white),
                    //                       ),
                    //                       backgroundColor: Colors.red,
                    //                     );
                    //                   }
                    //                 },
                    //                 child: Icon(Icons.send)),
                    //           ]),
                    //   ),
                    // ),
                    child: Container(
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
                        controller: commentController,
                        decoration: InputDecoration(
                            hintText: '  Write Comment',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 1),
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

