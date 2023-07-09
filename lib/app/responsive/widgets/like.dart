import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';


import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/posts_controller.dart';

class LikeButtonWidget extends StatefulWidget {
  bool isliked;
  int postId;
  int indexOfPost;
  int likeCount;
  LikeButtonWidget(
      {required this.isliked,
      required this.postId,
      required this.indexOfPost,
      required this.likeCount});
  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isLiked = false;

  final postController = Get.find<PostsController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.isliked;
    });
  }

  void _toggleLike(bool liked) {
    setState(() {
      isLiked = !isLiked;
    });

    postController.postLike(
        postId: widget.postId.toString(),
        isLiked: liked ? "1" : "0",
        index: widget.indexOfPost);
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    _toggleLike(!isLiked);

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   icon: Icon(
    //     isLiked ? Icons.favorite : Icons.favorite_border,
    //     color: isLiked ? Colors.red : Colors.black,
    //   ),
    //   onPressed: _toggleLike,
    // );

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: LikeButton(
        size: 22,
        onTap: onLikeButtonTapped,
        isLiked: widget.isliked,
        circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
           isLiked ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined ,
            color: isLiked ? kblue : const Color.fromARGB(255, 110, 109, 109),
            size: 22,
          );
        },
        likeCount: widget.likeCount,
        likeCountAnimationType: LikeCountAnimationType.part,
        countBuilder: (int? count, bool isLiked, String text) {
          final ColorSwatch<int> color = isLiked ? Colors.blue : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              'Like',
              style: TextStyle(color: color),
            );
          } else
            result = Text(
              count! >= 1000 ? (count / 1000.0).toStringAsFixed(1) + 'k' : text,
              style: TextStyle(color: color),
            );
          return result;
        },
      ),
    );
  }
}
