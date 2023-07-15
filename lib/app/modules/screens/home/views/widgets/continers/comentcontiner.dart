import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

import '../../../../../../data/components/controllers/posts_controller.dart';
import '../../../../../../data/components/controllers/profile_controller.dart';
import '../../../../../../data/models/comment_list_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class comentsContainer extends StatefulWidget {
  CommentsList commentsList;
  comentsContainer({super.key, required this.commentsList});

  @override
  State<comentsContainer> createState() => _comentsContainerState();
}

class _comentsContainerState extends State<comentsContainer> {
  var commentController = TextEditingController();
  var dialogeController = TextEditingController();
  var commentTextController = TextEditingController();
  final postController = Get.find<PostsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // GetBuilder<ProfileController>(builder: (_) {
        //     return Padding(
        //       padding: const EdgeInsets.only(right: 10),
        //       child: widget.commentsList.picture.isBlank ==
        //               null
        //           ? const CircleAvatar(
        //               backgroundImage:  AssetImage('assets/images/propic.jpg'),
        //             )
        //           : CircleAvatar(
        //               backgroundImage: NetworkImage(widget.commentsList.picture
        //                   .profileData.first.user.profilePicture),
        //             ),
        //     );
        //   }),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Container(
            width: 40,
            height: 40,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
              child: Image.network(
                widget.commentsList.picture,
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      widget.commentsList.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    timeago.format(widget.commentsList.createdAt),
                    //    widget.commentsList.createdAt,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  widget.commentsList.comment,
                  style: const TextStyle(fontSize: 11.3, fontWeight: FontWeight.w600),
                ),
              ),
        ksizedbox10 ],
          ),
        ),
      ],
    );
  }
}
