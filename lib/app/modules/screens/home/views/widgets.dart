import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

import 'package:reg_login/app/modules/screens/home/views/widgets/continers/comentcontiner.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/likepost.dart';
import 'package:reg_login/app/modules/screens/profile/friends_profile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/components/controllers/auth_controllers.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import '../../../../data/components/controllers/profile_controller.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../../../respohome/friendsprofile/friendsrespoprofile.dart';
import '../../../../responsive/widgets/like.dart';

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
  var reporingTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      postsController.getAllPost();
      await postsController.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      child: GetBuilder<PostsController>(builder: (_) {
        return postsController.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(
                  color: kblue,
                ),
              )
            : postsController.allPostList.isEmpty
                ? Center(
                    child: Image.asset("assets/icons/no_post.png"),
                  )
                : ListView.separated(
                    primary: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
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
                                  offset: const Offset(0.0, 0.7),
                                  blurRadius: 0.5,
                                  color: kgrey)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => RespoFriendsProfile(
                                            userId: postsController
                                                .allPostList[index].user.id,
                                          ));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        postsController.allPostList[index].user
                                                    .profilePicture ==
                                                null
                                            ? const CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/propic.jpg'),
                                                radius: 35,
                                              )
                                            : CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    postsController
                                                        .allPostList[index]
                                                        .user
                                                        .profilePicture),
                                                radius: 35,
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
                                                  .allPostList[index].user.name,
                                            )
                                                .text
                                                .bold
                                                .xl2
                                                .fontFamily(
                                                    GoogleFonts.poppins()
                                                        .fontFamily!)
                                                .make(),
                                            Text(postsController
                                                        .allPostList[index]
                                                        .user
                                                        .designation ??
                                                    postsController
                                                        .allPostList[index]
                                                        .user
                                                        .userName)
                                                .text
                                                .semiBold
                                                .sm
                                                .fontFamily(
                                                    GoogleFonts.poppins()
                                                        .fontFamily!)
                                                .make(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          timeago.format(postsController
                                              .allPostList[index].createdAt),
                                        )
                                            .text
                                            .sm
                                            .semiBold
                                            .fontFamily(GoogleFonts.poppins()
                                                .fontFamily!)
                                            .make(),
                                      ),
                                      if (postsController
                                              .allPostList[index].user.id !=
                                          profileController
                                              .profileData.first.user.id)
                                        InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  context: context,
                                                  builder: (context) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    50),
                                                            topRight:
                                                                Radius.circular(
                                                                    50),
                                                          )),
                                                          child: const Row(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20,
                                                                        top: 6),
                                                                child: Text(
                                                                  'Post Settings',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons.report),
                                                          title: const Text(
                                                            'Report',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onTap: () {
                                                            Get.back();
                                                            reporingTextController
                                                                .clear();
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        "Why are you reporting this post?"),
                                                                    content:
                                                                        TextField(
                                                                      controller:
                                                                          reporingTextController,
                                                                      onChanged:
                                                                          (value) {},
                                                                      // controller: _textFieldController,
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: "Irrelevant or annoying"),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (reporingTextController.text.isNotEmpty) {
                                                                              Get.back();
                                                                              postsController.reportAPost(userId: postsController.profileData.first.id.toString(), postId: postsController.allPostList[index].id.toString(), comment: reporingTextController.text);
                                                                            }
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Submit",
                                                                            style:
                                                                                primaryfont.copyWith(color: Colors.blue),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: const Icon(
                                                Icons.more_vert_rounded)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Container(
                              width: size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postsController.allPostList[index].title,
                                  )
                                      .text
                                      .semiBold
                                      .start
                                      .fontFamily(
                                          GoogleFonts.poppins().fontFamily!)
                                      .make(),
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                postController.allPostList[index].body == ""
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Text(''),
                                        // Image.asset(
                                        //   'assets/images/noimage.jpg',
                                        //   fit: BoxFit.cover,
                                        //   width: size.width * 0.3,
                                        // ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          postsController
                                              .allPostList[index].body
                                              .toString(),
                                          fit: BoxFit.cover,
                                          width: size.width * 0.4,
                                        ),
                                      ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      postsController.allPostList[index]
                                                  .likeCount ==
                                              0
                                          ? Container(
                                              width: 5,
                                            )
                                          : postsController.allPostList[index]
                                                      .likeCount ==
                                                  1
                                              ? InkWell(
                                                  onTap: () {
                                                    postController.getLikesList(
                                                        postId: postsController
                                                            .allPostList[index]
                                                            .id
                                                            .toString());
                                                    setState(() {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content:
                                                                  Container(
                                                                // decoration: BoxDecoration(),
                                                                height: 440,
                                                                width: 290,
                                                                child: Column(
                                                                  children: [
                                                                    ksizedbox10,
                                                                    Row(
                                                                      children: [
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            icon:
                                                                                const Icon(Icons.arrow_back)),
                                                                        const Text(
                                                                          'Reactions',
                                                                        )
                                                                            .text
                                                                            .bold
                                                                            .fontFamily(GoogleFonts.poppins().fontFamily!)
                                                                            .make(),
                                                                      ],
                                                                    ),
                                                                    ksizedbox10,
                                                                    GetBuilder<
                                                                            PostsController>(
                                                                        builder:
                                                                            (_) {
                                                                      return Container(
                                                                        height:
                                                                            350,
                                                                        width:
                                                                            290,
                                                                        child: postController.likesList.isEmpty
                                                                            ? Center(
                                                                                child: Text("No Likes Yet!").text.sm.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                              )
                                                                            : ListView.separated(
                                                                                physics: BouncingScrollPhysics(),
                                                                                itemCount: postController.likesList.length,
                                                                                itemBuilder: (BuildContext context, int index) {
                                                                                  return GestureDetector(
                                                                                    onTap: () {},
                                                                                    child: ListTile(
                                                                                      leading: postController.likesList[index].picture == ""
                                                                                          ? const CircleAvatar(
                                                                                              radius: 40,
                                                                                              backgroundImage: AssetImage('assets/images/propic.jpg'),
                                                                                            )
                                                                                          : CircleAvatar(
                                                                                              radius: 40,
                                                                                              backgroundImage: NetworkImage(postController.likesList[index].picture),
                                                                                            ),
                                                                                      title: Text(postController.likesList[index].userName).text.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                      subtitle: Text(postController.likesList[index].userName).text.size(7).fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                      trailing: Text(
                                                                                        timeago.format(postController.likesList[index].createdAt),
                                                                                      ).text.size(7).tight.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                separatorBuilder: (BuildContext context, int index) {
                                                                                  return Divider(
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
                                                  child: Text(
                                                          "${postsController.allPostList[index].likeCount} Likes")
                                                      .text
                                                      .semiBold
                                                      .fontFamily(
                                                          GoogleFonts.poppins()
                                                              .fontFamily!)
                                                      .make(),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    postController.getLikesList(
                                                        postId: postsController
                                                            .allPostList[index]
                                                            .id
                                                            .toString());
                                                    setState(() {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content:
                                                                  Container(
                                                                // decoration: BoxDecoration(),
                                                                height: 440,
                                                                width: 290,
                                                                child: Column(
                                                                  children: [
                                                                    ksizedbox10,
                                                                    Row(
                                                                      children: [
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            icon:
                                                                                const Icon(Icons.arrow_back)),
                                                                        const Text(
                                                                          'Reactions',
                                                                        )
                                                                            .text
                                                                            .bold
                                                                            .fontFamily(GoogleFonts.poppins().fontFamily!)
                                                                            .make(),
                                                                      ],
                                                                    ),
                                                                    ksizedbox10,
                                                                    GetBuilder<
                                                                            PostsController>(
                                                                        builder:
                                                                            (_) {
                                                                      return Container(
                                                                        height:
                                                                            350,
                                                                        width:
                                                                            290,
                                                                        child: postController.likesList.isEmpty
                                                                            ? Center(
                                                                                child: Text("No Likes Yet!").text.sm.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                              )
                                                                            : ListView.separated(
                                                                                physics: BouncingScrollPhysics(),
                                                                                itemCount: postController.likesList.length,
                                                                                itemBuilder: (BuildContext context, int index) {
                                                                                  return GestureDetector(
                                                                                    onTap: () {},
                                                                                    child: ListTile(
                                                                                      leading: postController.likesList[index].picture == ""
                                                                                          ? const CircleAvatar(
                                                                                              radius: 40,
                                                                                              backgroundImage: AssetImage('assets/images/propic.jpg'),
                                                                                            )
                                                                                          : CircleAvatar(
                                                                                              radius: 40,
                                                                                              backgroundImage: NetworkImage(postController.likesList[index].picture),
                                                                                            ),
                                                                                      title: Text(postController.likesList[index].userName).text.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                      subtitle: Text(postController.likesList[index].userName).text.size(7).fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                      trailing: Text(
                                                                                        timeago.format(postController.likesList[index].createdAt),
                                                                                      ).text.size(7).tight.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                separatorBuilder: (BuildContext context, int index) {
                                                                                  return Divider(
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
                                                  child: FutureBuilder(
                                                      future: postsController
                                                          .getLikedNames(
                                                              postId: postsController
                                                                  .allPostList[
                                                                      index]
                                                                  .id
                                                                  .toString()),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Text(
                                                              "...");
                                                        }
                                                        return Text(
                                                          "${snapshot.data} and other ${(postsController.allPostList[index].likeCount - 1).toString()} Likes",
                                                        )
                                                            .text
                                                            .semiBold
                                                            .fontFamily(GoogleFonts
                                                                    .poppins()
                                                                .fontFamily!)
                                                            .make();
                                                      })),
                                      // Text(
                                      //   postsController
                                      //       .allPostList[index].likeCount
                                      //       .toString(),
                                      //   style: TextStyle(
                                      //       fontSize: 13,
                                      //       fontWeight: FontWeight.w800),
                                      // ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      postController.getComments(
                                          postId: postsController
                                              .allPostList[index].id
                                              .toString());

                                      coments(context, index, size);
                                    },
                                    child: Text(
                                      '${postsController.allPostList[index].comment}  Comments'
                                          .toString(),
                                      //   '${postsController.allPostList[index].comment} comments',
                                      //   postsController
                                      //                          .allPostList[index]
                                      //                           .likeCount
                                      //                          .toString(),
                                    )
                                        .text
                                        .sm
                                        .semiBold
                                        .fontFamily(
                                            GoogleFonts.poppins().fontFamily!)
                                        .make(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Divider(
                                color: kgrey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  LikeButtonWidget(
                                    isliked: postsController
                                        .allPostList[index].likedByUser,
                                    postId:
                                        postsController.allPostList[index].id,
                                    indexOfPost: index,
                                    likeCount: postsController
                                        .allPostList[index].likeCount,
                                  ),
                                  // LikeButton(
                                  //   isliked: postsController
                                  //       .allPostList[index].likedByUser,
                                  //   postId:
                                  //       postsController.allPostList[index].id,
                                  //   indexOfPost: index,
                                  // ),

                                  kwidth10,
                                  InkWell(
                                    onTap: () {
                                      postController.getComments(
                                          postId: postsController
                                              .allPostList[index].id
                                              .toString());
                                      coments(context, index, size);
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
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
                              child:
                                  GetBuilder<ProfileController>(builder: (_) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.75),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              offset: const Offset(0.0, 0.80),
                                              color: kgrey.withOpacity(0.4),
                                              blurRadius: 0.2)
                                        ]),
                                    height: 42,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextField(
                                      controller: postsController
                                          .allPostList[index]
                                          .textEditingController,
                                      onChanged: (value) {
                                        postsController.update();
                                      },
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        suffixIcon: InkWell(
                                            onTap: () {
                                              print(postsController
                                                  .allPostList[index]
                                                  .textEditingController
                                                  .text);
                                              if (postsController
                                                  .allPostList[index]
                                                  .textEditingController
                                                  .text
                                                  .isNotEmpty) {
                                                postController.postComments(
                                                    index: index,
                                                    userID: profileController
                                                        .profileData
                                                        .first
                                                        .user
                                                        .id
                                                        .toString(),
                                                    postId: postsController
                                                        .allPostList[index].id
                                                        .toString(),
                                                    comment: postsController
                                                        .allPostList[index]
                                                        .textEditingController
                                                        .text);
                                                postsController
                                                    .allPostList[index]
                                                    .textEditingController
                                                    .clear();
                                                postController.update();
                                              } else {
                                                Get.rawSnackbar(
                                                  messageText: const Text(
                                                    "Type anything before commenting",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 194, 171, 169),
                                                );
                                              }
                                            },
                                            child: postsController
                                                    .allPostList[index]
                                                    .textEditingController
                                                    .text
                                                    .isNotEmpty
                                                ? Icon(Icons.send)
                                                : Container(
                                                    width: 5,
                                                  )),
                                        hintText: 'Write Comment',
                                        hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                        prefixIcon: profileController
                                                .profileData.isEmpty
                                            ? Container(
                                                width: 5,
                                                height: 10,
                                                color: const Color.fromARGB(
                                                    255, 231, 219, 218),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: Container(
                                                  width: 20,
                                                  child: Row(children: [
                                                    profileController
                                                                .profileData
                                                                .first
                                                                .user
                                                                .profilePicture ==
                                                            null
                                                        ? const CircleAvatar(
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/propic.jpg'),
                                                          )
                                                        : CircleAvatar(
                                                            backgroundImage: NetworkImage(
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
                              }),
                            ),
                            ksizedbox20,
                          ],
                        ),
                      );
                    },
                  );
      }),
    );
  }

  Future<dynamic> coments(BuildContext context, int index, Size size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Container(
                height: 350,
                width: 700,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: postController.allPostList[index].body == ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/noimage.jpg',
                                fit: BoxFit.cover,
                                width: 150,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                postsController.allPostList[index].body,
                                fit: BoxFit.contain,
                                width: 250,
                                height: 250,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 20),
                      child: Column(
                        children: [
                          Container(
                            color: kwhite,
                            height: 250,
                            width: 320,
                            child: GetBuilder<PostsController>(builder: (_) {
                              return postsController.commentsList.isEmpty
                                  ? Center(
                                      child: Text("No Comments Yet!")
                                          .text
                                          .semiBold
                                          .fontFamily(
                                              GoogleFonts.poppins().fontFamily!)
                                          .make(),
                                    )
                                  : ListView.separated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          height: 3,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          comentsContainer(
                                        commentsList:
                                            postsController.commentsList[index],
                                      ),
                                      itemCount:
                                          postsController.commentsList.length,
                                    );
                            }),
                          ),
                          //
                          ksizedbox20,
                          GetBuilder<ProfileController>(
                            builder: (_) {
                              return Container(
                                height: 42,
                                width: 280,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: const Offset(0.0, 0.80),
                                          color: kgrey.withOpacity(0.4),
                                          blurRadius: 0.2)
                                    ]),
                                child: TextField(
                                  controller: postsController
                                      .allPostList[index].textEditingController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          print(postsController
                                              .allPostList[index]
                                              .textEditingController
                                              .text);
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
                                                "Type anything before commenting",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 246, 244, 244),
                                            );
                                          }
                                        },
                                        child: const Icon(Icons.send)),
                                    hintText: 'Write Comment',
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    prefixIcon:
                                        profileController.profileData.isEmpty
                                            ? Container(
                                                width: 5,
                                                height: 10,
                                                color: const Color.fromARGB(
                                                    255, 238, 234, 233),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: Container(
                                                  width: 20,
                                                  child: Row(
                                                    children: [
                                                      profileController
                                                                  .profileData
                                                                  .first
                                                                  .user
                                                                  .profilePicture ==
                                                              null
                                                          ? const CircleAvatar(
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/images/profile_icon.png'),
                                                            )
                                                          : CircleAvatar(
                                                              backgroundImage: NetworkImage(
                                                                  profileController
                                                                      .profileData
                                                                      .first
                                                                      .user
                                                                      .profilePicture),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                  ),
                                ),
                              );
                            },
                          ),
                          //
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
