import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/responsive/widgets/chat_view/chat_list_view.dart';
import 'package:reg_login/app/responsive/widgets/chat_view/respochat/respo.dart';

class ChatListViewRespo extends StatefulWidget {
  const ChatListViewRespo({super.key});

  @override
  State<ChatListViewRespo> createState() => _ChatListViewRespoState();
}

class _ChatListViewRespoState extends State<ChatListViewRespo> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  GetBuilder<ProfileController>(builder: (_) {
        return profileController.profileData.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const ViewChatsUserListRespo();
      });
  }
}
