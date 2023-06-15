// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:simpa/constands/constands.dart';
// import 'package:simpa/controllers/posts_controller.dart';
// import 'package:simpa/widgets/bottumnavigationbar.dart';

// import 'package:timeago/timeago.dart' as timeago;

// class NotficationReactionView extends StatefulWidget {
//   int likeCount;
//   int postId;
//   NotficationReactionView(
//       {super.key, required this.likeCount, required this.postId});

//   @override
//   State<NotficationReactionView> createState() => _reacton_screenState();
// }

// class _reacton_screenState extends State<NotficationReactionView> {
//   final postController = Get.find<PostsController>();

//   @override
//   void initState() {
//     super.initState();
//     postController.getLikesList(postId: widget.postId.toString());
//   }

//   getBack() {
//     Get.offAll(() => BottomNavigationBarExample(
//           index: 0,
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(90),
//           child: AppBar(
//             bottom: TabBar(
//                 isScrollable: false,
//                 labelColor: kblue,
//                 indicatorColor: kblue,
//                 tabs: [
//                   Tab(
//                     text: 'ALL',
//                   ),
//                   Row(
//                     children: [
//                       kheartbutton,
//                      const SizedBox(
//                         width: 5,
//                       ),
//                       Tab(
//                         text: "",
//                       ),
//                     ],
//                   )
//                 ]),
//             title: const Text(
//               'Reactions',
//             ),
//             backgroundColor: kwhite,
//             leading: IconButton(
//                 onPressed: () {
//                   Get.to(BottomNavigationBarExample());
//                 },
//                 icon: const Icon(Icons.arrow_back)),
//           ),
//         ),
//         body: WillPopScope(
//           onWillPop: () {
//             return getBack();
//           },
//           child: TabBarView(children: [
//             GetBuilder<PostsController>(builder: (_) {
//               return ListView.separated(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: postController.likesList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {},
//                     child: ListTile(
//                         leading: postController.likesList[index].picture == ""
//                             ? const CircleAvatar(
//                                 radius: 40,
//                                 backgroundImage:
//                                     AssetImage('assets/icons/profile_icon.png'),
//                               )
//                             : CircleAvatar(
//                                 radius: 40,
//                                 backgroundImage: NetworkImage(
//                                     postController.likesList[index].picture),
//                               ),
//                         title: Text(postController.likesList[index].userName),
//                         subtitle:
//                             Text(postController.likesList[index].userName),
//                         trailing: Text(
//                           timeago.format(
//                               postController.likesList[index].createdAt),
//                           style: const TextStyle(fontSize: 10),
//                         )),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const Divider(
//                     height: 1,
//                   );
//                 },
//               );
//             }),
//             GetBuilder<PostsController>(builder: (_) {
//               return ListView.separated(
//                 physics: BouncingScrollPhysics(),
//                 itemCount: postController.likesList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {},
//                     child: ListTile(
//                         leading: postController.likesList[index].picture == ""
//                             ? CircleAvatar(
//                                 radius: 40,
//                                 backgroundImage:
//                                     AssetImage('assets/icons/profile_icon.png'),
//                               )
//                             : CircleAvatar(
//                                 radius: 40,
//                                 backgroundImage: NetworkImage(
//                                     postController.likesList[index].picture),
//                               ),
//                         title: Text(postController.likesList[index].userName),
//                         subtitle:
//                             Text(postController.likesList[index].userName),
//                         trailing: Text(
//                           timeago.format(
//                               postController.likesList[index].createdAt),
//                           style: const TextStyle(fontSize: 10),
//                         )),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return Divider(
//                     height: 1,
//                   );
//                 },
//               );
//             }),
//           ]),
//         ),
//       ),
//     );
//   }
// }
