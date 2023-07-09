import 'package:flutter/material.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

import '../../../../responsive/widgets/chat_view/chat_list_view.dart';
import '../../../../responsive/widgets/chat_view/respochat/chatlistrespo.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      child: ChatListViewRespo(),
    );
  }
}
