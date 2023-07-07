//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../widgets/common_appbar.dart';

class NotoficationCommentView extends StatefulWidget {
  int postId;
  NotoficationCommentView({super.key, required this.postId});

  @override
  State<NotoficationCommentView> createState() =>
      _NotoficationCommentViewState();
}

class _NotoficationCommentViewState extends State<NotoficationCommentView> {
  final postController = Get.find<PostsController>();

  var commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    postController.getComments(postId: widget.postId.toString());
  }

  getBack() {
    Get.offAll(() => HomepageRespo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: PreferredSize(child: appbar_leading(title : 'Friends',imageurl: 'assets/images/Vector3.png',), preferredSize: Size.fromHeight(55)),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: appbar(
            title: 'Comments  ',
          )),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
            ],
          ),
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(children: [
              postController.profileData.first.profilePicture == null
                  ? const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_icon.png'),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                          postController.profileData.first.profilePicture),
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                    controller: commentTextController,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Add a comments")),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  if (commentTextController.text.isNotEmpty) {
                    postController.postComments(
                        userID: postController.profileData.first.id.toString(),
                        postId: widget.postId.toString(),
                        index: 0,
                        comment: commentTextController.text);
                    commentTextController.clear();
                  } else {
                    Get.rawSnackbar(
                      messageText: const Text(
                        "type anything before commenting",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: Icon(Icons.send),
              ),
            ]),
          ),
        ),
      ),
      body: GetBuilder<PostsController>(builder: (_) {
        return postController.commentsList.isEmpty
            ? const Center(
                child: Text("No comments yet!"),
              )
            : WillPopScope(
                onWillPop: () {
                  return getBack();
                },
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: postController.commentsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                          leading: postController.commentsList[index].picture ==
                                  null
                              ? const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/profile_icon.png'),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(postController
                                      .commentsList[index].picture),
                                ),
                          title:
                              Text(postController.commentsList[index].userName),
                          subtitle:
                              Text(postController.commentsList[index].comment),
                          trailing: Text(
                            timeago.format(
                                postController.commentsList[index].createdAt),
                            style: const TextStyle(fontSize: 10),
                          )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                ),
              );
      }),
    );
  }
}
