import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/continers/comentcontiner.dart';
import 'package:reg_login/app/modules/screens/profile/friends_profile.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/controllers/auth_controllers.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../data/components/controllers/profile_controller.dart';
import '../../../../responsive/widgets/like.dart';


class FillterWidget extends StatefulWidget {
  const FillterWidget({super.key});

  @override
  State<FillterWidget> createState() => _FillterWidgetState();
}

class _FillterWidgetState extends State<FillterWidget> {
  final postsController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();
  var commentController = TextEditingController();
  var dialogeController = TextEditingController();
  var commentTextController = TextEditingController();
  final postController = Get.find<PostsController>();
   var reporingTextController = TextEditingController();

  bool _isfavorite = false;
  bool _isfavorite2 = false;
  int filterindex = 0;
  @override
  void initState() {
    super.initState();
    authController.getDepartmentList();
    postsController.getAllInFilterPost();
  }

  // var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        GetBuilder<AuthController>(builder: (_) {
          return Container(
            height: 700,
            width: 200,
            color: kwhite,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    ksizedbox30,
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        authController.selctedIndex.value == 100
                                            ? Color(0xff3C73B1)
                                            : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  // setState(() {
                                  //   _salesTap = !_salesTap;
                                  // });
                                  postsController.getAllInFilterPost();
                                  authController.selctedIndex(100);
                                  authController.update();
                                },
                                child: Text(
                                  "All Posts",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          authController.selctedIndex.value ==
                                                  100
                                              ? kwhite
                                              : kgrey),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Container(
                    height: 500,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: authController.departments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Expanded(
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
                                          fontSize: 15,
                                          color: authController
                                                      .selctedIndex.value ==
                                                  index
                                              ? kwhite
                                              : kgrey),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.88,
              width: MediaQuery.of(context).size.width * 0.38,
              child: GetBuilder<PostsController>(builder: (_) {
                return postsController.isLoading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(
                          color: kblue,
                        ),
                      )
                    : postsController.filterList.isEmpty
                        ? Center(
                            child: Text(''),
                          )
                        : ListView.separated(
                            primary: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 10),
                            shrinkWrap: true,
                            itemCount: postsController.filterList.length,
                            itemBuilder: (context, index) {
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
            : postsController.filterList.isEmpty
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
                    itemCount: postsController.filterList.length,
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
                                  InkWell( onTap: () {
                                                          Get.to(() =>
                                                              FriendsProfileScreen(
                                                                userId: postsController
                                                                    .filterList[
                                                                        index]
                                                                    .user
                                                                    .id,
                                                              ));
                                                        },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        postsController.filterList[index].user
                                                    .profilePicture ==
                                                null
                                            ? const CircleAvatar(
                                                backgroundImage:  AssetImage('assets/images/propic.jpg'),
                                                radius: 35,
                                              )
                                            : CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    postsController
                                                        .filterList[index]
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
                                                  .filterList[index].user.name,
                                            )
                                                .text
                                                .bold
                                                .xl2
                                                .fontFamily(GoogleFonts.poppins()
                                                    .fontFamily!)
                                                .make(),
                                            Text(postsController
                                                        .filterList[index]
                                                        .user
                                                        .designation ??
                                                    postsController
                                                        .filterList[index]
                                                        .user
                                                        .userName)
                                                .text
                                                .semiBold
                                                .sm
                                                .fontFamily(GoogleFonts.poppins()
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
                                              .filterList[index].createdAt),
                                        )
                                            .text
                                            .sm
                                            .semiBold
                                            .fontFamily(GoogleFonts.poppins()
                                                .fontFamily!)
                                            .make(),
                                      ),
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
                                                                      left: 20,
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
                                                              context: context,
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
                                                                    decoration: const InputDecoration(
                                                                        hintText:
                                                                            "Irrelevant or annoying"),
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (reporingTextController
                                                                              .text
                                                                              .isNotEmpty) {
                                                                            Get.back();
                                                                            postsController.reportAPost(
                                                                                userId: postsController.profileData.first.id.toString(),
                                                                                postId: postsController.filterList[index].id.toString(),
                                                                                comment: reporingTextController.text);
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
                              width: size.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postsController.filterList[index].title,
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
                                postController.filterList[index].body == ""
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
                                              .filterList[index].body
                                              .toString(),
                                          fit: BoxFit.cover,
                                          width: size.width * 0.3,
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
                                      postsController.filterList[index]
                                                  .likeCount ==
                                              0
                                          ? Container(
                                              width: 5,
                                            )
                                          : postsController.filterList[index]
                                                      .likeCount ==
                                                  1
                                              ? InkWell(onTap: () {
                                                    postController.getLikesList(
                                                        postId: postsController
                                                            .filterList[index]
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
                                                                                              backgroundImage:  AssetImage('assets/images/propic.jpg'),
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
                                                    "${postsController.filterList[index].likeCount} Likes").text.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
                                              )
                                              : InkWell(
                                                  onTap: () {
                                                    postController.getLikesList(
                                                        postId: postsController
                                                            .filterList[index]
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
                                                                                              backgroundImage:  AssetImage('assets/images/propic.jpg'),
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
                                                                  .filterList[
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
                                                          "${snapshot.data} and other ${(postsController.filterList[index].likeCount - 1).toString()} Likes",
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
                                      //       .filterList[index].likeCount
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
                                              .filterList[index].id
                                              .toString());

                                      coments(context, index, size);
                                    },
                                    child: Text(
                                      '${postsController.filterList[index].comment}  Comments'
                                          .toString(),
                                      //   '${postsController.filterList[index].comment} comments',
                                      //   postsController
                                      //                          .filterList[index]
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
                                children: [  LikeButtonWidget(
                                              isliked: postsController
                                                  .filterList[index]
                                                  .likedByUser,
                                              postId: postsController
                                                  .filterList[index].id,
                                              indexOfPost: index,
                                              likeCount: postsController
                                                  .filterList[index].likeCount,
                                            ),
                                  // LikeButton(
                                  //   isliked: postsController
                                  //       .filterList[index].likedByUser,
                                  //   postId:
                                  //       postsController.filterList[index].id,
                                  //   indexOfPost: index,
                                  // ),

                                  kwidth10,
                                  InkWell(
                                    onTap: () {
                                      postController.getComments(
                                          postId: postsController
                                              .filterList[index].id
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
                              //             .filterList[index].id
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
                                          .filterList[index]
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
                                                  .filterList[index]
                                                  .textEditingController
                                                  .text);
                                              if (postsController
                                                  .filterList[index]
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
                                                        .filterList[index].id
                                                        .toString(),
                                                    comment: postsController
                                                        .filterList[index]
                                                        .textEditingController
                                                        .text);
                                                postsController
                                                    .filterList[index]
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
                                                    .filterList[index]
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
                                                                 AssetImage('assets/images/propic.jpg'),
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



//                               return Container(
//                                 //   height: MediaQuery.of(context).size.height * 0.88,
//                                 width: MediaQuery.of(context).size.width * 0.38,
//                                 decoration: BoxDecoration(
//                                     color: kwhite,
//                                     boxShadow: <BoxShadow>[
//                                       BoxShadow(
//                                           offset: const Offset(0.0, 0.7),
//                                           blurRadius: 0.5,
//                                           color: kgrey)
//                                     ],
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Column(
//                                   children: [
//                                     ksizedbox10,
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20, vertical: 10),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               postsController
//                                                           .filterList[index]
//                                                           .user
//                                                           .profilePicture ==
//                                                       null
//                                                   ? const CircleAvatar(
//                                                       backgroundImage: AssetImage(
//                                                           'assets/icons/profile_icon.png'),
//                                                       radius: 35,
//                                                     )
//                                                   : CircleAvatar(
//                                                       backgroundImage:
//                                                           NetworkImage(
//                                                               postsController
//                                                                   .filterList[
//                                                                       index]
//                                                                   .user
//                                                                   .profilePicture),
//                                                       radius: 35,
//                                                     ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     postsController
//                                                         .filterList[index]
//                                                         .user
//                                                         .name,
//                                                   )
//                                                       .text
//                                                       .bold
//                                                       .xl2
//                                                       .fontFamily( 
//                                                           GoogleFonts.poppins()
//                                                               .fontFamily!)
//                                                       .make(),
//                                                   Text(postsController
//                                                               .filterList[index]
//                                                               .user
//                                                               .designation ??
//                                                           postsController
//                                                               .filterList[index]
//                                                               .user
//                                                               .userName)
//                                                       .text
//                                                       .semiBold
//                                                       .sm
//                                                       .fontFamily(
//                                                           GoogleFonts.poppins()
//                                                               .fontFamily!)
//                                                       .make(),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Text(
//                                               timeago.format(postsController
//                                                   .filterList[index].createdAt),
//                                             )
//                                                 .text
//                                                 .sm
//                                                 .semiBold
//                                                 .fontFamily(
//                                                     GoogleFonts.poppins()
//                                                         .fontFamily!)
//                                                 .make(),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     ksizedbox10,
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         left: 35,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             postsController
//                                                 .filterList[index].title,
//                                           )
//                                               .text
//                                               .semiBold
//                                               .fontFamily(GoogleFonts.poppins()
//                                                   .fontFamily!)
//                                               .make(),
//                                         ],
//                                       ),
//                                     ),
//                                     ksizedbox10,
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         postController.filterList[index].body ==
//                                                 ""
//                                             ? ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 child: 
// Image.asset(
//                                                   'assets/images/noimage.jpg',
//                                                   fit: BoxFit.cover,
//                                                   width: size.width * 0.3,
//                                                 ),
//                                               )
//                                             : ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 child: Image.network(
//                                                   postsController
//                                                       .filterList[index].body
//                                                       .toString(),
//                                                   fit: BoxFit.cover,
//                                                   width: size.width * 0.3,
//                                                 ),
//                                               ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               IconButton(
//                                                   onPressed: () {
//                                                     postController.getLikesList(
//                                                         postId: postsController
//                                                             .filterList[index]
//                                                             .id
//                                                             .toString());
//                                                     setState(() {
//                                                       showDialog(
//                                                           context: context,
//                                                           builder: (context) {
//                                                             return AlertDialog(
//                                                               content:
//                                                                   Container(
//                                                                 // decoration: BoxDecoration(),
//                                                                 height: 440,
//                                                                 width: 290,
//                                                                 child: Column(
//                                                                   children: [
//                                                                     ksizedbox10,
//                                                                     Row(
//                                                                       children: [
//                                                                         IconButton(
//                                                                             onPressed:
//                                                                                 () {
//                                                                               Get.back();
//                                                                             },
//                                                                             icon:
//                                                                                 const Icon(Icons.arrow_back)),
//                                                                         const Text(
//                                                                           'Reactions',
//                                                                         )
//                                                                             .text
//                                                                             .bold
//                                                                             .fontFamily(GoogleFonts.poppins().fontFamily!)
//                                                                             .make(),
//                                                                       ],
//                                                                     ),
//                                                                     ksizedbox10,
//                                                                     GetBuilder<
//                                                                             PostsController>(
//                                                                         builder:
//                                                                             (_) {
//                                                                       return Container(
//                                                                         height:
//                                                                             350,
//                                                                         width:
//                                                                             290,
//                                                                         child: postController.likesList.isEmpty
//                                                                             ? Center(
//                                                                                 child: Text("No Likes Yet!").text.sm.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
//                                                                               )
//                                                                             : ListView.separated(
//                                                                                 physics: BouncingScrollPhysics(),
//                                                                                 itemCount: postController.likesList.length,
//                                                                                 itemBuilder: (BuildContext context, int index) {
//                                                                                   return GestureDetector(
//                                                                                     onTap: () {},
//                                                                                     child: ListTile(
//                                                                                       leading: postController.likesList[index].picture == ""
//                                                                                           ? const CircleAvatar(
//                                                                                               radius: 40,
//                                                                                               backgroundImage:  AssetImage('assets/images/propic.jpg'),
//                                                                                             )
//                                                                                           : CircleAvatar(
//                                                                                               radius: 40,
//                                                                                               backgroundImage: NetworkImage(postController.likesList[index].picture),
//                                                                                             ),
//                                                                                       title: Text(postController.likesList[index].userName).text.semiBold.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
//                                                                                       subtitle: Text(postController.likesList[index].userName).text.size(7).fontFamily(GoogleFonts.poppins().fontFamily!).make(),
//                                                                                       trailing: Text(
//                                                                                         timeago.format(postController.likesList[index].createdAt),
//                                                                                       ).text.size(7).tight.fontFamily(GoogleFonts.poppins().fontFamily!).make(),
//                                                                                     ),
//                                                                                   );
//                                                                                 },
//                                                                                 separatorBuilder: (BuildContext context, int index) {
//                                                                                   return Divider(
//                                                                                     height: 1,
//                                                                                   );
//                                                                                 },
//                                                                               ),
//                                                                       );
//                                                                     }),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           });
//                                                     });
//                                                   },
//                                                   icon: Icon(
//                                                     Icons.favorite,
//                                                     color: Colors.red,
//                                                     size: 15,
//                                                   )),
//                                               Text(
//                                                 postsController
//                                                     .filterList[index].likeCount
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     fontSize: 13,
//                                                     fontWeight:
//                                                         FontWeight.w800),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.2,
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 20),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 postController.getComments(
//                                                     postId: postsController
//                                                         .filterList[index].id
//                                                         .toString());

//                                                 coments(context, index, size);
//                                               },
//                                               child: Text(
//                                                 '${postsController.filterList[index].comment}  Comments'
//                                                     .toString(),
//                                                 //   '${postsController.filterList[index].comment} comments',
//                                                 //   postsController
//                                                 //                          .filterList[index]
//                                                 //                           .likeCount
//                                                 //                          .toString(),
//                                               )
//                                                   .text
//                                                   .sm
//                                                   .semiBold
//                                                   .fontFamily(
//                                                       GoogleFonts.poppins()
//                                                           .fontFamily!)
//                                                   .make(),
//                                             ),
//                                           ),
//                                           kwidth10
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 10, right: 10),
//                                       child: Divider(
//                                         color: kgrey,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 20),
//                                       child: Row(
//                                         children: [
//                                           // LikeButton(
//                                           //   isliked: postsController
//                                           //       .filterList[index].likedByUser,
//                                           //   postId: postsController
//                                           //       .filterList[index].id,
//                                           //   indexOfPost: index,
//                                           // ),
//                                           InkWell(
//                                             onTap: () {
//                                               postController.getComments(
//                                                   postId: postsController
//                                                       .filterList[index].id
//                                                       .toString());
//                                               coments(context, index, size);
//                                             },
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.only(top: 5),
//                                               child:
//                                                   Icon(Icons.comment_rounded),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     ksizedbox30,
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 30, right: 30),
//                                       // child: Container(
//                                       //   decoration: BoxDecoration(
//                                       //     color: Colors.white,
//                                       //     boxShadow: [
//                                       //       BoxShadow(
//                                       //           blurRadius: 5,
//                                       //           color: Colors.grey.withOpacity(0.5)),
//                                       //     ],
//                                       //   ),
//                                       //   height: 60,
//                                       //   width: 333,
//                                       //   child: Padding(
//                                       //     padding: const EdgeInsets.only(left: 10, right: 10),
//                                       //     child:
//                                       //     postController.profileData.isEmpty
//                                       //         ? Container(
//                                       //             width: 5,
//                                       //           )
//                                       //        :
//                                       //          Container(
//                                       //           width: 222,
//                                       //            child: Row(
//                                       //             children: [
//                                       //               postController
//                                       //                           .profileData.first.profilePicture ==
//                                       //                       null
//                                       //                   ? const CircleAvatar(
//                                       //                       backgroundImage: AssetImage(
//                                       //                           'assets/images/Group 89.png'),
//                                       //                     )
//                                       //                   : CircleAvatar(
//                                       //                       backgroundImage: NetworkImage(
//                                       //                           postController.profileData.first
//                                       //                               .profilePicture),
//                                       //                     ),
//                                       //               const SizedBox(width: 10),
//                                       //               Expanded(
//                                       //                 child: TextField(
//                                       //                     controller: commentTextController,
//                                       //                     decoration:
//                                       //                         const InputDecoration.collapsed(
//                                       //                             hintText: "Add a comments")),
//                                       //               ),
//                                       //               const SizedBox(width: 10),
//                                       //               InkWell(
//                                       // onTap: () {
//                                       //   if (commentTextController
//                                       //       .text.isNotEmpty) {
//                                       //     postController.postComments(
//                                       //         userID: postController
//                                       //             .profileData.first.id
//                                       //             .toString(),
//                                       //         postId: postsController
//                                       //             .filterList[index].id
//                                       //             .toString(),
//                                       //         comment:
//                                       //             commentTextController.text);
//                                       //     commentTextController.clear();
//                                       //   } else {
//                                       //     Get.rawSnackbar(
//                                       //       messageText: const Text(
//                                       //         "type anything before commenting",
//                                       //         style:
//                                       //             TextStyle(color: Colors.white),
//                                       //       ),
//                                       //       backgroundColor: Colors.red,
//                                       //     );
//                                       //   }
//                                       // },
//                                       //                   child: Icon(Icons.send)),
//                                       //             ]),
//                                       //          ),
//                                       //   ),
//                                       // ),
//                                       child: GetBuilder<ProfileController>(
//                                           builder: (_) {
//                                         return Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white
//                                                     .withOpacity(0.75),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 boxShadow: <BoxShadow>[
//                                                   BoxShadow(
//                                                       offset: const Offset(
//                                                           0.0, 0.80),
//                                                       color: kgrey
//                                                           .withOpacity(0.4),
//                                                       blurRadius: 0.2)
//                                                 ]),
//                                             height: 42,
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             child: TextField(
//                                               controller: postsController
//                                                   .filterList[index]
//                                                   .textEditingController,
//                                               onChanged: (value) {
//                                                 postsController.update();
//                                               },
//                                               decoration: InputDecoration(
//                                                 border:
//                                                     const OutlineInputBorder(
//                                                         borderSide:
//                                                             BorderSide.none),
//                                                 suffixIcon: InkWell(
//                                                     onTap: () {
//                                                       print(postsController
//                                                           .filterList[index]
//                                                           .textEditingController
//                                                           .text);
//                                                       if (postsController
//                                                           .filterList[index]
//                                                           .textEditingController
//                                                           .text
//                                                           .isNotEmpty) {
//                                                         postController.postComments(
//                                                             index: index,
//                                                             userID:
//                                                                 profileController
//                                                                     .profileData
//                                                                     .first
//                                                                     .user
//                                                                     .id
//                                                                     .toString(),
//                                                             postId:
//                                                                 postsController
//                                                                     .filterList[
//                                                                         index]
//                                                                     .id
//                                                                     .toString(),
//                                                             comment: postsController
//                                                                 .filterList[
//                                                                     index]
//                                                                 .textEditingController
//                                                                 .text);
//                                                         postsController
//                                                             .filterList[index]
//                                                             .textEditingController
//                                                             .clear();
//                                                         postController.update();
//                                                       } else {
//                                                         Get.rawSnackbar(
//                                                           messageText:
//                                                               const Text(
//                                                             "Type anything before commenting",
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                     .white),
//                                                           ),
//                                                           backgroundColor:
//                                                               const Color
//                                                                       .fromARGB(
//                                                                   255,
//                                                                   194,
//                                                                   171,
//                                                                   169),
//                                                         );
//                                                       }
//                                                     },
//                                                     child: postsController
//                                                             .filterList[index]
//                                                             .textEditingController
//                                                             .text
//                                                             .isNotEmpty
//                                                         ? Icon(Icons.send)
//                                                         : Container(
//                                                             width: 5,
//                                                           )),
//                                                 hintText: 'Write Comment',
//                                                 hintStyle: const TextStyle(
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.black),
//                                                 prefixIcon:
//                                                     profileController
//                                                             .profileData.isEmpty
//                                                         ? Container(
//                                                             width: 5,
//                                                             height: 10,
//                                                             color: const Color
//                                                                     .fromARGB(
//                                                                 255,
//                                                                 231,
//                                                                 219,
//                                                                 218),
//                                                           )
//                                                         : Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     right: 30),
//                                                             child: Container(
//                                                               width: 20,
//                                                               child: Row(
//                                                                   children: [
//                                                                     profileController.profileData.first.user.profilePicture ==
//                                                                             null
//                                                                         ? const CircleAvatar(
//                                                                             backgroundImage:
//                                                                                  AssetImage('assets/images/propic.jpg'),
//                                                                           )
//                                                                         : CircleAvatar(
//                                                                             backgroundImage:
//                                                                                 NetworkImage(profileController.profileData.first.user.profilePicture),
//                                                                           ),
//                                                                   ]),
//                                                             ),
//                                                           ),
//                                               ),
//                                             ));
//                                       }),
//                                     ),
//                                     ksizedbox20,
//                                   ],
//                                 ),
//                               );
                            },
                          );
              }),
            )
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.88,
            //   width: MediaQuery.of(context).size.width * 0.38,
            //   child: GetBuilder<PostsController>(
            //     builder: (_) {
            //       return postsController.isLoading.isTrue
            //           ? Center(
            //               child: CircularProgressIndicator(
            //                 color: kblue,
            //               ),
            //             )
            //           : postsController.filterList.isEmpty
            //               ? Center(
            //                   child: Image.asset("assets/icons/no_post.png"),
            //                 )
            //               : ListView.separated(
            //                   primary: true,
            //                   scrollDirection: Axis.vertical,
            //                   separatorBuilder:
            //                       (BuildContext context, int index) =>
            //                           SizedBox(height: 10),
            //                   shrinkWrap: true,
            //                   itemCount: postsController.filterList.length,
            //                   itemBuilder: (context, index) {
            //                     return Container(
            //                       // height: MediaQuery.of(context).size.height * 0.88,
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.38,
            //                       decoration: BoxDecoration(
            //                           color: kwhite,
            //                           boxShadow: <BoxShadow>[
            //                             BoxShadow(
            //                                 offset: Offset(0.0, 0.7),
            //                                 blurRadius: 0.5,
            //                                 color: kgrey)
            //                           ],
            //                           borderRadius: BorderRadius.circular(10)),
            //                       child: Column(
            //                         children: [
            //                           ksizedbox10,
            //                           Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                                 horizontal: 10),
            //                             child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Row(
            //                                   children: [
            //                                     postsController
            //                                                 .filterList[index]
            //                                                 .user
            //                                                 .profilePicture ==
            //                                             null
            //                                         ? const CircleAvatar(
            //                                             backgroundImage: AssetImage(
            //                                                 'assets/icons/profile_icon.png'),
            //                                             radius: 25,
            //                                           )
            //                                         : CircleAvatar(
            //                                             backgroundImage:
            //                                                 NetworkImage(
            //                                                     postsController
            //                                                         .filterList[
            //                                                             index]
            //                                                         .user
            //                                                         .profilePicture),
            //                                           ),
            //                                     const SizedBox(
            //                                       width: 10,
            //                                     ),
            //                                     Column(
            //                                       crossAxisAlignment:
            //                                           CrossAxisAlignment.start,
            //                                       children: [
            //                                         Text(
            //                                           postsController
            //                                               .filterList[index]
            //                                               .user
            //                                               .name,
            //                                           style: ktextstyle22,
            //                                         ),
            //                                         Text(postsController
            //                                                 .filterList[index]
            //                                                 .user
            //                                                 .designation ??
            //                                             postsController
            //                                                 .filterList[index]
            //                                                 .user
            //                                                 .userName)
            //                                       ],
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Text(
            //                                   timeago.format(postsController
            //                                       .filterList[index].createdAt),
            //                                   style: const TextStyle(
            //                                       fontSize: 15,
            //                                       fontWeight: FontWeight.w500),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                           ksizedbox30,
            //                           Padding(
            //                             padding: const EdgeInsets.only(
            //                                 left: 35, top: 5),
            //                             child: Row(
            //                               children: [
            //                                 Text(
            //                                   postsController
            //                                       .filterList[index].title,
            //                                   style: TextStyle(
            //                                       fontSize: 18.5,
            //                                       fontWeight: FontWeight.w500),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                           ksizedbox30,
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               postController.filterList[index]
            //                                           .body ==
            //                                       ""
            //                                   ? ClipRRect(
            //                                       borderRadius:
            //                                           BorderRadius.circular(10),
            //                                       child: Image.asset(
            //                                         'assets/images/noimage.jpg',
            //                                         fit: BoxFit.cover,
            //                                         width: size.width * 0.3,
            //                                       ),
            //                                     )
            //                                   : ClipRRect(
            //                                       borderRadius:
            //                                           BorderRadius.circular(10),
            //                                       child: Image.network(
            //                                         postsController
            //                                             .filterList[index]
            //                                             .body,
            //                                         fit: BoxFit.contain,
            //                                         width: size.width * 0.3,
            //                                         height: size.height * 0.4,
            //                                       ),
            //                                     ),
            //                             ],
            //                           ),
            //                           Padding(
            //                             padding:
            //                                 const EdgeInsets.only(left: 20),
            //                             child: Row(
            //                               children: [
            //                                 Row(
            //                                   children: [
            //                                     IconButton(
            //                                         onPressed: () {
            //                                           postController.getLikesList(
            //                                               postId:
            //                                                   postsController
            //                                                       .filterList[
            //                                                           index]
            //                                                       .id
            //                                                       .toString());
            //                                           setState(() {
            //                                             showDialog(
            //                                                 context: context,
            //                                                 builder: (context) {
            //                                                   return AlertDialog(
            //                                                     content:
            //                                                         Container(
            //                                                       // decoration: BoxDecoration(),
            //                                                       height: 440,
            //                                                       width: 290,
            //                                                       child: Column(
            //                                                         children: [
            //                                                           ksizedbox10,
            //                                                           Row(
            //                                                             children: [
            //                                                               IconButton(
            //                                                                   onPressed: () {
            //                                                                     Get.back();
            //                                                                   },
            //                                                                   icon: Icon(Icons.arrow_back)),
            //                                                               Text(
            //                                                                 'Reactions',
            //                                                                 style:
            //                                                                     TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            //                                                               )
            //                                                             ],
            //                                                           ),
            //                                                           ksizedbox10,
            //                                                           GetBuilder<
            //                                                                   PostsController>(
            //                                                               builder:
            //                                                                   (_) {
            //                                                             return Container(
            //                                                               height:
            //                                                                   350,
            //                                                               width:
            //                                                                   290,
            //                                                               child:
            //                                                                   ListView.separated(
            //                                                                 physics:
            //                                                                     BouncingScrollPhysics(),
            //                                                                 itemCount:
            //                                                                     postController.likesList.length,
            //                                                                 itemBuilder:
            //                                                                     (BuildContext context, int index) {
            //                                                                   return GestureDetector(
            //                                                                     onTap: () {},
            //                                                                     child: ListTile(
            //                                                                         leading: postController.likesList[index].picture == ""
            //                                                                             ? const CircleAvatar(
            //                                                                                 radius: 40,
            //                                                                                 backgroundImage:  AssetImage('assets/images/propic.jpg'),
            //                                                                               )
            //                                                                             : CircleAvatar(
            //                                                                                 radius: 40,
            //                                                                                 backgroundImage: NetworkImage(postController.likesList[index].picture),
            //                                                                               ),
            //                                                                         title: Text(postController.likesList[index].userName),
            //                                                                         subtitle: Text(postController.likesList[index].userName),
            //                                                                         trailing: Text(
            //                                                                           timeago.format(postController.likesList[index].createdAt),
            //                                                                           style: const TextStyle(fontSize: 10),
            //                                                                         )),
            //                                                                   );
            //                                                                 },
            //                                                                 separatorBuilder:
            //                                                                     (BuildContext context, int index) {
            //                                                                   return const Divider(
            //                                                                     height: 1,
            //                                                                   );
            //                                                                 },
            //                                                               ),
            //                                                             );
            //                                                           }),
            //                                                         ],
            //                                                       ),
            //                                                     ),
            //                                                   );
            //                                                 });
            //                                           });
            //                                         },
            //                                         icon: Icon(
            //                                           Icons.favorite,
            //                                           color: Colors.pink,
            //                                           size: 15,
            //                                         )),
            //                                     Text(
            //                                       postsController
            //                                           .filterList[index]
            //                                           .likeCount
            //                                           .toString(),
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.w800),
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 SizedBox(
            //                                   width: MediaQuery.of(context)
            //                                           .size
            //                                           .width *
            //                                       0.2,
            //                                 ),
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 20),
            //                                   child: InkWell(
            //                                       onTap: () {
            //                                         postController.getComments(
            //                                             postId: postsController
            //                                                 .filterList[index]
            //                                                 .id
            //                                                 .toString());

            //                                         showDialog(
            //                                             context: context,
            //                                             builder: (context) {
            //                                               return Padding(
            //                                                 padding:
            //                                                     const EdgeInsets
            //                                                             .only(
            //                                                         left: 110),
            //                                                 child: Row(
            //                                                   children: [
            //                                                     Container(
            //                                                       height: 350,
            //                                                       width: MediaQuery.of(
            //                                                                   context)
            //                                                               .size
            //                                                               .width *
            //                                                           0.6,
            //                                                       decoration:
            //                                                           BoxDecoration(
            //                                                               color:
            //                                                                   kwhite),
            //                                                       child: Row(
            //                                                         children: [
            //                                                           Padding(
            //                                                             padding:
            //                                                                 const EdgeInsets.only(left: 15),
            //                                                             child:
            //                                                                 Row(
            //                                                               children: [
            //                                                                 Image.network(
            //                                                                   postsController.filterList[index].body,
            //                                                                   fit: BoxFit.cover,
            //                                                                   width: size.width * 0.3,
            //                                                                   height: size.height * 0.4,
            //                                                                 ),
            //                                                               ],
            //                                                             ),
            //                                                           ),
            //                                                           Padding(
            //                                                             padding: const EdgeInsets.only(
            //                                                                 top:
            //                                                                     35,
            //                                                                 left:
            //                                                                     20),
            //                                                             child:
            //                                                                 Container(
            //                                                               height:
            //                                                                   300,
            //                                                               width:
            //                                                                   300,
            //                                                               child:
            //                                                                   GetBuilder<PostsController>(builder: (_) {
            //                                                                 return ListView.builder(
            //                                                                   shrinkWrap: true,
            //                                                                   itemBuilder: (context, index) => comentsContainer(
            //                                                                     commentsList: postsController.commentsList[index],
            //                                                                   ),
            //                                                                   itemCount: postsController.commentsList.length,
            //                                                                 );
            //                                                               }),
            //                                                             ),
            //                                                           ),
            //                                                         ],
            //                                                       ),
            //                                                     ),
            //                                                   ],
            //                                                 ),
            //                                               );
            //                                             });
            //                                       },
            //                                       child: Text(
            //                                         '${postsController.filterList[index].comment} Comments'
            //                                             .toString(),
            //                                         //   '${postsController.filterList[index].comment} comments',
            //                                         //   postsController
            //                                         //                          .filterList[index]
            //                                         //                           .likeCount
            //                                         //                          .toString(),
            //                                         style: const TextStyle(
            //                                             fontSize: 13,
            //                                             fontWeight:
            //                                                 FontWeight.w500),
            //                                       )),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(
            //                                 left: 10, right: 10),
            //                             child: Divider(
            //                               color: Colors.black,
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding:
            //                                 const EdgeInsets.only(left: 20),
            //                             child: Row(
            //                               children: [
            //                                 LikeFilterButton(
            //                                   isliked: postsController
            //                                       .filterList[index]
            //                                       .likedByUser,
            //                                   postId: postsController
            //                                       .filterList[index].id,
            //                                   indexOfPost: index,
            //                                 ),
            //                                 InkWell(
            //                                   onTap: () {
            //                                     postController.getComments(
            //                                         postId: postsController
            //                                             .filterList[index].id
            //                                             .toString());
            //                                   },
            //                                   child: Padding(
            //                                     padding: const EdgeInsets.only(
            //                                         top: 5),
            //                                     child:
            //                                         Icon(Icons.comment_rounded),
            //                                   ),
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                           ksizedbox30,
            //                           Padding(
            //                             padding: const EdgeInsets.only(
            //                                 left: 30, right: 30),
            //                             // child: Container(
            //                             //   decoration: BoxDecoration(
            //                             //     color: Colors.white,
            //                             //     boxShadow: [
            //                             //       BoxShadow(
            //                             //           blurRadius: 5,
            //                             //           color: Colors.grey.withOpacity(0.5)),
            //                             //     ],
            //                             //   ),
            //                             //   height: 60,
            //                             //   width: 333,
            //                             //   child: Padding(
            //                             //     padding: const EdgeInsets.only(left: 10, right: 10),
            //                             //     child:
            //                             //     postController.profileData.isEmpty
            //                             //         ? Container(
            //                             //             width: 5,
            //                             //           )
            //                             //        :
            //                             //          Container(
            //                             //           width: 222,
            //                             //            child: Row(
            //                             //             children: [
            //                             //               postController
            //                             //                           .profileData.first.profilePicture ==
            //                             //                       null
            //                             //                   ? const CircleAvatar(
            //                             //                       backgroundImage: AssetImage(
            //                             //                           'assets/images/Group 89.png'),
            //                             //                     )
            //                             //                   : CircleAvatar(
            //                             //                       backgroundImage: NetworkImage(
            //                             //                           postController.profileData.first
            //                             //                               .profilePicture),
            //                             //                     ),
            //                             //               const SizedBox(width: 10),
            //                             //               Expanded(
            //                             //                 child: TextField(
            //                             //                     controller: commentTextController,
            //                             //                     decoration:
            //                             //                         const InputDecoration.collapsed(
            //                             //                             hintText: "Add a comments")),
            //                             //               ),
            //                             //               const SizedBox(width: 10),
            //                             //               InkWell(
            //                             // onTap: () {
            //                             //   if (commentTextController
            //                             //       .text.isNotEmpty) {
            //                             //     postController.postComments(
            //                             //         userID: postController
            //                             //             .profileData.first.id
            //                             //             .toString(),
            //                             //         postId: postsController
            //                             //             .filterList[index].id
            //                             //             .toString(),
            //                             //         comment:
            //                             //             commentTextController.text);
            //                             //     commentTextController.clear();
            //                             //   } else {
            //                             //     Get.rawSnackbar(
            //                             //       messageText: const Text(
            //                             //         "type anything before commenting",
            //                             //         style:
            //                             //             TextStyle(color: Colors.white),
            //                             //       ),
            //                             //       backgroundColor: Colors.red,
            //                             //     );
            //                             //   }
            //                             // },
            //                             //                   child: Icon(Icons.send)),
            //                             //             ]),
            //                             //          ),
            //                             //   ),
            //                             // ),
            //                             child: GetBuilder<ProfileController>(
            //                               builder: (_) {
            //                                 return Container(
            //                                   decoration: BoxDecoration(
            //                                       color: Colors.white
            //                                           .withOpacity(0.75),
            //                                       borderRadius:
            //                                           BorderRadius.circular(15),
            //                                       boxShadow: <BoxShadow>[
            //                                         BoxShadow(
            //                                             offset: const Offset(
            //                                                 0.0, 0.80),
            //                                             color: kgrey
            //                                                 .withOpacity(0.4),
            //                                             blurRadius: 0.2)
            //                                       ]),
            //                                   height: 42,
            //                                   width: MediaQuery.of(context)
            //                                       .size
            //                                       .width,
            //                                   child: TextFormField(
            //                                     controller: postsController
            //                                         .filterList[index]
            //                                         .textEditingController,
            //                                     decoration: InputDecoration(
            //                                       isDense: true,
            //                                       border:
            //                                           const OutlineInputBorder(
            //                                               borderSide:
            //                                                   BorderSide.none),
            //                                       suffixIcon: InkWell(
            //                                           onTap: () {
            //                                             print(postsController
            //                                                 .filterList[index]
            //                                                 .textEditingController
            //                                                 .text);
            //                                             if (postsController
            //                                                 .filterList[index]
            //                                                 .textEditingController
            //                                                 .text
            //                                                 .isNotEmpty) {
            //                                               postController.postComments(
            //                                                   index: index,
            //                                                   userID: profileController
            //                                                       .profileData
            //                                                       .first
            //                                                       .user
            //                                                       .id
            //                                                       .toString(),
            //                                                   postId: postsController
            //                                                       .filterList[
            //                                                           index]
            //                                                       .id
            //                                                       .toString(),
            //                                                   comment: postsController
            //                                                       .filterList[
            //                                                           index]
            //                                                       .textEditingController
            //                                                       .text);
            //                                               postsController
            //                                                   .filterList[index]
            //                                                   .textEditingController
            //                                                   .clear();
            //                                               postController
            //                                                   .update();
            //                                             } else {
            //                                               Get.rawSnackbar(
            //                                                 messageText:
            //                                                     const Text(
            //                                                   "type anything before commenting",
            //                                                   style: TextStyle(
            //                                                       color: Colors
            //                                                           .white),
            //                                                 ),
            //                                                 backgroundColor:
            //                                                     Colors.red,
            //                                               );
            //                                             }
            //                                           },
            //                                           child: Icon(Icons.send)),
            //                                       contentPadding:
            //                                           EdgeInsets.symmetric(
            //                                               horizontal: 20),
            //                                       hintText: 'Write Comment',
            //                                       hintStyle: const TextStyle(
            //                                           fontSize: 12,
            //                                           color: Colors.black),
            //                                       prefixIcon:
            //                                           profileController
            //                                                   .profileData
            //                                                   .isEmpty
            //                                               ? Container(
            //                                                   width: 5,
            //                                                   height: 10,
            //                                                   color: Colors.red,
            //                                                 )
            //                                               : Padding(
            //                                                   padding:
            //                                                       const EdgeInsets
            //                                                               .only(
            //                                                           right:
            //                                                               40),
            //                                                   child: Container(
            //                                                     width: 10,
            //                                                     child: Row(
            //                                                       children: [
            //                                                         profileController.profileData.first.user.profilePicture ==
            //                                                                 null
            //                                                             ? const CircleAvatar(
            //                                                                 backgroundImage:
            //                                                                      AssetImage('assets/images/propic.jpg'),
            //                                                               )
            //                                                             : CircleAvatar(
            //                                                                 backgroundImage:
            //                                                                     NetworkImage(profileController.profileData.first.user.profilePicture),
            //                                                               ),
            //                                                       ],
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                     ),
            //                                   ),
            //                                 );
            //                               },
            //                             ),
            //                           ),
            //                           ksizedbox20
            //                         ],
            //                       ),
            //                     );
            //                   },
            //                 );
            //     },
            //   ),
            // ),
          ],
        ),
      ],
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
                        child: postController.filterList[index].body == ""
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
                                  postsController.filterList[index].body,
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
                                            .fontFamily(GoogleFonts.poppins()
                                                .fontFamily!)
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
                                          commentsList: postsController
                                              .commentsList[index],
                                        ),
                                        itemCount:
                                            postsController.commentsList.length,
                                      );
                              }),
                            ),
                            //
                            ksizedbox20,
                            GetBuilder<ProfileController>(builder: (_) {
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
                                        .filterList[index]
                                        .textEditingController,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            print(postsController
                                                .filterList[index]
                                                .textEditingController
                                                .text);
                                            if (postsController
                                                .filterList[index]
                                                .textEditingController
                                                .text
                                                .isNotEmpty) {
                                              postController.postComments(
                                                  index: index,
                                                  userID: profileController
                                                      .profileData.first.user.id
                                                      .toString(),
                                                  postId: postsController
                                                      .filterList[index].id
                                                      .toString(),
                                                  comment: postsController
                                                      .filterList[index]
                                                      .textEditingController
                                                      .text);
                                              postsController.filterList[index]
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
                                      prefixIcon: profileController
                                              .profileData.isEmpty
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
                                                ]),
                                              ),
                                            ),
                                    ),
                                  ));
                            }),
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
        });
  }
}
