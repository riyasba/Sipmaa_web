import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        //               backgroundImage: AssetImage('assets/images/createprofile.png'),
        //             )
        //           : CircleAvatar(
        //               backgroundImage: NetworkImage(widget.commentsList.picture
        //                   .profileData.first.user.profilePicture),
        //             ),
        //     );
        //   }),
        // // ClipRRect(
        //   borderRadius: BorderRadius.circular(70),
        //   child: Image.network(
        //     widget.commentsList.picture,
        //     fit: BoxFit.cover,
        //     width: 20,
        //     height: 20,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 7, left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.commentsList.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  widget.commentsList.comment,
                  style: TextStyle(fontSize: 11.3, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              timeago.format(widget.commentsList.createdAt),
              //    widget.commentsList.createdAt,
              style: TextStyle(fontSize: 11),
            ),
          ],
        )
      ],
    );
  }
}
