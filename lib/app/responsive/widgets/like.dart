import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../data/components/controllers/posts_controller.dart';

class LikeButton extends StatefulWidget {
  bool isliked;
  int postId;
  int indexOfPost;
  LikeButton({
    required this.isliked,
    required this.postId,
    required this.indexOfPost,
  });
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  final postController = Get.find<PostsController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.isliked;
    });
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    postController.postLike(
        postId: widget.postId.toString(),
        isLiked: isLiked ? "1" : "0",
        index: widget.indexOfPost);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : Colors.black,
      ),
      onPressed: _toggleLike,
    );
  }
}
