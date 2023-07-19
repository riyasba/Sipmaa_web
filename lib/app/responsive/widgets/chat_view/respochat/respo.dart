import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/respohome/searchrespo/saerchrespo.dart';
import 'package:reg_login/app/responsive/widgets/chat_view/respochat/viewmsgrespo.dart';
import 'package:reg_login/app/responsive/widgets/chat_view/user_chat_card.dart';
import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/controllers/chat_controller.dart';
import '../../../../data/components/controllers/profile_controller.dart';
import '../../../../data/models/chat_models.dart';
import '../../../../respohome/respochat/chatviewrespo.dart';
import '../../../view/search_friends/search_friends_view.dart';

class ViewChatsUserListRespo extends StatefulWidget {
  const ViewChatsUserListRespo({Key? key}) : super(key: key);

  @override
  State<ViewChatsUserListRespo> createState() => _ViewChatsUserListRespoState();
}

class _ViewChatsUserListRespoState extends State<ViewChatsUserListRespo> {
  final chatController = Get.find<ChatController>();
  final myProfileController = Get.find<ProfileController>();

  bool isRealtime = true;

  late ScrollController scrollcontroller;
  int cpage = 1;

  @override
  void initState() {
    super.initState();
    scrollcontroller = ScrollController();
    scrollcontroller.addListener(_scrollListener);
  }

  _scrollListener() {
    if (scrollcontroller.offset >= scrollcontroller.position.maxScrollExtent &&
        !scrollcontroller.position.outOfRange) {
      print("Reached The Bottom...");
      setState(() {
        isRealtime = false;
      });
      fetchData();
    }
    if (scrollcontroller.offset <= scrollcontroller.position.minScrollExtent &&
        !scrollcontroller.position.outOfRange) {
      setState(() {
        isRealtime = true;
      });
      print("Reached The Top");
    }
  }

  fetchData() {
    Stream<QuerySnapshot<Object?>> stream = chatController.getMoreChatList(
        myProfileController.profileData.first.user.id,
        20,
        chatController.chatListUsers.last);
    stream.listen((event) {
      print(event.docs.length);
      event.docs.forEach((element) {
        chatController.chatListUsers.add(element);
      });
    });
    chatController.update();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(8)),
      // height: size.height * 0.68,
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      child: ListView(
        shrinkWrap: true,
        controller: scrollcontroller,
        children: [
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          //Arcived tile
          // StreamBuilder<QuerySnapshot>(
          //     stream: chatController.getArchivedChatList(
          //         myProfileController.profileData.first.user.id, 20),
          //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (snapshot.hasData) {
          //         return snapshot.data!.docs.isNotEmpty
          //             ? Padding(
          //                 padding: const EdgeInsets.only(left: 15, right: 15),
          //                 child: InkWell(
          //                   onTap: () {
          //                     Get.to(ArchivedChatsView());
          //                   },
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Row(children: [
          //                         const SizedBox(
          //                           width: 10,
          //                         ),
          //                         const Icon(
          //                           CupertinoIcons.archivebox_fill,
          //                           color: Colors.black38,
          //                         ),
          //                         const SizedBox(
          //                           width: 10,
          //                         ),
          //                         Text(
          //                           "Archived",
          //                           style: primaryfont.copyWith(
          //                               fontSize: 16,
          //                               fontWeight: FontWeight.w500),
          //                         )
          //                       ]),
          //                       Text(
          //                         snapshot.data!.docs.length.toString(),
          //                         style:
          //                             primaryfont.copyWith(color: primaryColor),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               )
          //             : Container(
          //                 height: 2,
          //               );
          //       } else {
          //         return Container(
          //           height: 3,
          //         );
          //       }
          //     }),
          // const Divider(),
          // StreamBuilder<QuerySnapshot>(
          //     stream: chatController.getPinned(
          //         myProfileController.profileData.first.user.id, 20),
          //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (snapshot.hasData) {
          //         WidgetsBinding.instance.addPostFrameCallback((_) {
          //           chatController
          //               .isPinChatIsEmpty(snapshot.data!.docs.isEmpty);
          //         });
          //         if (snapshot.data!.docs.isNotEmpty) {
          //           return ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: snapshot.data!.docs.length,
          //               physics: const NeverScrollableScrollPhysics(),
          //               itemBuilder: (context, index) {
          //                 ChatListModel chatList = ChatListModel.fromDocument(
          //                     snapshot.data!.docs[index]);
          //                 return Container(
          //                   child: InkWell(
          //                       onTap: () {
          //                         chatController.makeAsRead(
          //                             chatList.userId, chatList.users.first);
          //                         Get.to(() => ViewMessageScreen(
          //                               chatModel: chatList,
          //                               peerId: chatList.userId,
          //                             ));
          //                       },
          //                       onLongPress: () {
          //                         modalBottomSheetDeleteChat(
          //                             size, context, chatList);
          //                       },
          //                       child: UserChatCard(chatUser: chatList)),
          //                 );
          //               });
          //         } else {
          //           return Container(
          //             height: 5,
          //           );
          //         }
          //       } else {
          //         return Center(
          //             child: Container(
          //           height: 5,
          //         ));
          //       }
          //     }),
          StreamBuilder<QuerySnapshot>(
              stream: chatController.getChatList(
                  myProfileController.profileData.first.user.id, 20),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    chatController.isChatIsEmpty(snapshot.data!.docs.isEmpty);
                  });

                  if (snapshot.data!.docs.isNotEmpty) {
                    if (isRealtime) {
                      chatController.chatListUsers = snapshot.data!.docs;
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: chatController.chatListUsers.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ChatListModel chatList = ChatListModel.fromDocument(
                              chatController.chatListUsers[index]);
                          return Container(
                            child: InkWell(
                                onTap: () {
                                  print(
                                      "---------------------------------------");
                                  chatController.makeAsRead(
                                      chatList.userId, chatList.users.first);
                                  Get.offAll(() => ViewMessageScreenRespo(
                                        chatModel: chatList,
                                        peerId: chatList.userId,
                                      ));
                                },
                                onLongPress: () {
                                  // modalBottomSheetDeleteChat(
                                  //     size, context, chatList);
                                },
                                child: UserChatCard(chatUser: chatList)),
                          );
                        });
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Find Friends and start chatting!",
                            style: primaryfont.copyWith(
                                color: Colors.black87, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const RespoSrech());
                            },
                            child: Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(20)),
                              alignment: Alignment.center,
                              child: Text(
                                "Search Friends",
                                style:
                                    primaryfont.copyWith(color: Colors.white),
                              ),
                            ),
                          )
                          // Text('No chats ')
                        ],
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
