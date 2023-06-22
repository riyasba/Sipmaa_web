import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../../modules/screens/home/views/widgets/likepost.dart';
import '../../../data/components/constands/constands.dart';
import '../../../data/components/controllers/posts_controller.dart';
import '../../../data/models/get_all_post_modals.dart';
import '../coments.dart';
import '../reactions_page.dart';

class PostView extends StatefulWidget {
  Post postData;
  PostView({super.key, required this.postData});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final postsController = Get.find<PostsController>();

  void _showDeletePostOptions(String postId) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (builder) {
          return Container(
            height: 162,
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                ),
                Center(
                    child: Text(
                  "Do you want to Delete this post?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () async {
                          Get.find<PostsController>()
                              .deletePost(postId: postId);
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(fontSize: 15, color: kwhite),
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: kblue, width: 1),
                            minimumSize: Size(110, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, color: kblue),
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 30),
            child: Container(
              width: double.infinity,
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            widget.postData.user.profilePicture == null
                                ? const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/icons/profile_icon.png'),
                                    radius: 25,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        widget.postData.user.profilePicture),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.postData.user.name,
                                  style: ktextstyle22,
                                ),
                                Text(widget.postData.user.designation ??
                                        widget.postData.user.userName)
                                   ,
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              timeago.format(widget.postData.createdAt),
                              style: const TextStyle(fontSize: 10),
                            ),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                topRight: Radius.circular(50),
                                              )),
                                              child: Row(
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 6),
                                                    child: Text(
                                                      'Post Settings',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.delete),
                                              title: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                _showDeletePostOptions(widget
                                                    .postData.id
                                                    .toString());
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Icon(Icons.more_vert_rounded))
                          ],
                        ),
                      ],
                    ),
                    ksizedbox10,
                    // Text(widget.postData.title)
                    //     .animate()
                    //     .fade()
                    //     .scale(),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(widget.postData.title),
                    ksizedbox10,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 300,
                        child: Image.network(
                          widget.postData.body.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ksizedbox10,
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(reacton_screen(
                                  likeCount: widget.postData.likeCount,
                                  postId: widget.postData.id,
                                ));
                              },
                              child:
                                  Text(widget.postData.likeCount.toString())),
                          InkWell(
                              onTap: () {
                                Get.to(coments(
                                  postId: widget.postData.id,
                                ));
                              },
                              child: Text(
                                '${widget.postData.comment} comments',
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          height: 1,
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        LikeButton(
                          isliked: widget.postData.likedByUser,
                          postId: widget.postData.id,
                          indexOfPost: 0,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            postsController.commentsList.clear();
                            postsController.update();
                            Get.to(coments(
                              postId: widget.postData.id,
                            ));
                          },
                     //     child: kcomentbutton,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
