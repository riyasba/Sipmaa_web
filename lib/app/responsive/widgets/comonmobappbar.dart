import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/responsive/view/create.dart';
import 'package:reg_login/app/responsive/view/search_page.dart';

import '../../data/components/controllers/posts_controller.dart';
import '../../modules/screens/home/views/create_widget.dart';
import '../view/filter_page.dart';

class ComenappBarmob extends StatelessWidget {
  ComenappBarmob({
    super.key,
  });

  final postsController = Get.find<PostsController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GetBuilder<PostsController>(builder: (_) {
        return Text(
          postsController.profileData.isEmpty
              ? ""
              : '${postsController.profileData.first.name}\n${postsController.profileData.first.designation ?? ""}',
          style: const TextStyle(fontSize: 15, color: Colors.white),
        );
      }),
      //  toolbarHeight: 55,
      elevation: 0,
      backgroundColor: kblue,
      // leading: Padding(
      //   padding: const EdgeInsets.only(left: 5, top: 5),
      //   child: postsController.profileData.isEmpty
      //       ? Container()
      //       : postsController.profileData.first.profilePicture == null
      //           ? const CircleAvatar(
      //               backgroundImage:
      //                   AssetImage('assets/icons/profile_icon.png'),
      //               radius: 45,
      //             )
      //           : CircleAvatar(
      //               backgroundImage: NetworkImage(
      //                   postsController.profileData.first.profilePicture),
      //               radius: 45,
      //             ),
      // ),
      // title: const Image(
      //     height: 50, image: AssetImage("assets/images/title.jpg")),
      // centerTitle: true,

      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(SearchPage());
              },
              child: Icon(Icons.search),
              // child: ksearch
            ),
            const SizedBox(
              width: 17,
            ),
            GestureDetector(
              onTap: () {
                Get.to(FilterPage());
              },
              child: Icon(Icons.filter),
              //      child: kfilterbutton
            ),
            const SizedBox(
              width: 17,
            ),
            GestureDetector(
              onTap: () {
                Get.to(CreateWidgetrespo());
              },
              child: Icon(Icons.add_a_photo),
              //   child: kimgadd
            ),
          ],
        ),
      ],
    );
  }
}
