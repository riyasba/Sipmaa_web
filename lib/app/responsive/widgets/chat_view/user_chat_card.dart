import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/components/constands/constands.dart';
import '../../../data/components/constands/message_types.dart';
import '../../../data/components/controllers/chat_controller.dart';
import '../../../data/components/controllers/profile_controller.dart';
import '../../../data/models/chat_models.dart';

class UserChatCard extends StatefulWidget {
  ChatListModel chatUser;
  UserChatCard({
    required this.chatUser,
  });

  @override
  State<UserChatCard> createState() => _UserChatCardState();
}

class _UserChatCardState extends State<UserChatCard> {
  final chatController = Get.find<ChatController>();
  final myProfileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.chatUser.photo == ""
                            ? Container(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                        "assets/icons/profile_icon.png")),
                              )
                            : Container(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    widget.chatUser.photo,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                "${widget.chatUser.firstName} ${widget.chatUser.lastName}",
                                overflow: TextOverflow.ellipsis,
                                style: primaryfont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (widget.chatUser.messageType ==
                                MessageType().text)
                              SizedBox(
                                  width: size.width * 0.25,
                                  child: Text(
                                    widget.chatUser.message,
                                    style: primaryfont.copyWith(
                                        color: Colors.black45, fontSize: 12),
                                  )),
                            if (widget.chatUser.messageType ==
                                MessageType().activity)
                              SizedBox(
                                  width: size.width * 0.25,
                                  child: Text(
                                    "Shared an Activity",
                                    style: primaryfont.copyWith(
                                        color: Colors.black45, fontSize: 12),
                                  )),
                            if (widget.chatUser.messageType ==
                                MessageType().reserved)
                              SizedBox(
                                  width: size.width * 0.63,
                                  child: Text(
                                    "Reserved an Activity",
                                    style: primaryfont.copyWith(
                                        color: Colors.black45, fontSize: 12),
                                  )),
                            if (widget.chatUser.messageType ==
                                MessageType().image)
                              SizedBox(
                                  width: size.width * 0.25,
                                  child: Text(
                                    "Image",
                                    style: primaryfont.copyWith(
                                        color: Colors.black45, fontSize: 12),
                                  )),
                            if (widget.chatUser.messageType ==
                                MessageType().profile)
                              SizedBox(
                                  width: size.width * 0.25,
                                  child: Text(
                                    "Shared a profile",
                                    style: primaryfont.copyWith(
                                        color: Colors.black45, fontSize: 12),
                                  ))
                          ],
                        ),
                      ],
                    ),
                    ////
                    Column(
                      children: [
                        Text(
                          DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                              int.parse(widget.chatUser.updatedAt),
                            ),
                          ),
                          style: primaryfont.copyWith(
                              color: Colors.black45, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (widget.chatUser.readStatus)
                          StreamBuilder<QuerySnapshot>(
                              stream: chatController.getUnReadCountStatus(
                                  widget.chatUser.chatId,
                                  myProfileController
                                      .profileData.first.user.id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.docs.isNotEmpty) {
                                    return Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: kblue),
                                      alignment: Alignment.center,
                                      child: Text(
                                          snapshot.data!.docs.length.toString(),
                                          style: primaryfont.copyWith(
                                              color: Colors.white,
                                              fontSize: 13)),
                                    );
                                  } else {
                                    return Container(
                                      height: 22,
                                      width: 22,
                                    );
                                  }
                                } else {
                                  return Container(
                                    height: 22,
                                    width: 22,
                                  );
                                }
                              })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(),
      ],
    );
  }
}
