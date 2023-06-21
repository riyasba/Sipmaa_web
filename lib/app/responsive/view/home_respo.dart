import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:reg_login/app/responsive/view/reactions_page.dart';



import '../../modules/screens/home/views/widgets/likepost.dart';
import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/auth_controllers.dart';
import '../../data/components/controllers/posts_controller.dart';
import '../../data/components/controllers/profile_controller.dart';

import '../widgets/comonmobappbar.dart';
import '../widgets/drawer.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'coments.dart';


class HomepageRespo extends StatefulWidget {
  HomepageRespo({super.key});

  @override
  State<HomepageRespo> createState() => _HomepageRespoState();
}

class _HomepageRespoState extends State<HomepageRespo> {
  final postsController = Get.find<PostsController>();
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    getValues();
  }

  // saveToken() async {
  //     var token = await FirebaseMessaging.instance.getToken();
  //     authController.fcmtoken(token: token.toString(), id: profileController.profileData.first.user.id.toString());
  //     print("............firebase token.......=====================>>>");
  //     print(token);
  // }

  getValues() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      postsController.getAllPost();
      await postsController.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ComenappBarmob(),
      ),
      drawer: MobileDrawer(),
      body: GetBuilder<PostsController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: postsController.allPostList.length,
            itemBuilder: (context, index) {
              return Container(
               // height: MediaQuery.of(context).size.height * 0.8,
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
                                          postsController.allPostList[index]
                                              .user.profilePicture),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postsController
                                        .allPostList[index].user.name,
                                    style: ktextstyle22,
                                  ),
                                  Text(postsController.allPostList[index].user
                                          .designation ??
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              postsController.allPostList[index].body
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      postsController.getLikesList(
                                          postId: postsController
                                              .allPostList[index].id
                                              .toString());
                                    },
                                    icon: InkWell(
                                      onTap: () {
                                        Get.to(reacton_screen(
                                          likeCount: postsController
                                              .allPostList[index].likeCount,
                                          postId: postsController
                                              .allPostList[index].id,
                                        ));
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                        size: 15,
                                      ),
                                    )),
                                Text(postsController
                                    .allPostList[index].likeCount
                                    .toString())
                                //                             Text(
                                // //postsController.allPostList[index].likeCount
                                //   //                                .toString(),
                                //                               style: TextStyle(
                                //                                   fontSize: 13, fontWeight: FontWeight.w800),
                                //                             ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                  onTap: () {
                                    Get.to(coments(
                                      postId:
                                          postsController.allPostList[index].id,
                                    ));
                                  },
                                  child: Text(
                                    '${postsController.allPostList[index].comment} comments',
                                  )),
                              // child: InkWell(
                              //     onTap: () {
                              //       postsController.getComments(
                              //           postId: postsController
                              //               .allPostList[index].id
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
                              //       //                               .allPostList[
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
                              //       '${postsController.allPostList[index].comment} Coments'
                              //           .toString(),
                              //       //   '${postsController.allPostList[index].comment} comments',
                              //       //   postsController
                              //       //                          .allPostList[index]
                              //       //                           .likeCount
                              //       //                          .toString(),
                              //       style: TextStyle(fontSize: 13),
                              //     )),
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
                              isliked: postsController
                                  .allPostList[index].likedByUser,
                              postId: postsController.allPostList[index].id,
                              indexOfPost: index,
                            ),
                            kwidth10,
                            InkWell(
                              onTap: () {
                                postsController.getComments(
                                    postId: postsController
                                        .allPostList[index].id
                                        .toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(coments(
                                        postId: postsController
                                            .allPostList[index].id,
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
                      //                 .allPostList[index].textEditingController,
                      //             decoration: InputDecoration(
                      //               border: OutlineInputBorder(
                      //                   borderSide: BorderSide.none),
                      //               suffixIcon: InkWell(
                      //                   onTap: () {
                      //                     print(postsController.allPostList[index]
                      //                         .textEditingController.text);
                      //                     if (postsController
                      //                         .allPostList[index]
                      //                         .textEditingController
                      //                         .text
                      //                         .isNotEmpty) {
                      //                       postsController.postComments(
                      //                           index: index,
                      //                           userID: profileController
                      //                               .profileData.first.user.id
                      //                               .toString(),
                      //                           postId: postsController
                      //                               .allPostList[index].id
                      //                               .toString(),
                      //                           comment: postsController
                      //                               .allPostList[index]
                      //                               .textEditingController
                      //                               .text);
                      //                       postsController.allPostList[index]
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
                  ksizedbox20  ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
