import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';


import '../../../data/components/controllers/profile_controller.dart';
import 'chat_list.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery .of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kblue,
        title: const Text("Chats"),
      ),
      body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.profileData.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const ViewChatsUserList();
      }),
    );
  }
}
