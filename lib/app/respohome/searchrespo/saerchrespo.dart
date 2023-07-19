import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/respohome/Comonappbar/appbar.dart';
import 'package:reg_login/app/respohome/Responsive.dart';
import 'package:reg_login/app/respohome/pofile_respo.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../modules/screens/home/views/searchcontainer.dart';
import '../../modules/screens/home/views/widgets/friends_search_screen.dart';
import '../../modules/screens/home/views/widgets/friends_widget.dart';




class RespoSrech extends StatefulWidget {
  const RespoSrech({
    super.key,
  });

  // final String title;

  @override
  State<RespoSrech> createState() => _RespoSrechState();
}

final profileController = Get.find<ProfileController>();

class _RespoSrechState extends State<RespoSrech> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xffCAE1FF),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: AppbarComn()),
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(widget.title),
        // ),
        body: Responsive(
            mobile: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10, child: FriendsSearch()
                    //  HomeContainer()
                    ),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10, child: FriendsSearch()),
                kwidth10,
                Expanded(
                    flex: size.width > 1340 ? 3 : 5,
                    child: HomeFriendsWidget()),
                kwidth10
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 3 : 5, child: ProfileRespo()),
                Expanded(
                    flex: size.width > 1340 ? 7 : 9, child: FriendsSearch()),
                kwidth10,
                Expanded(
                    flex: size.width > 1340 ? 3 : 5,
                    child: HomeFriendsWidget()),
                kwidth10
              ],
            )));
  }
}

