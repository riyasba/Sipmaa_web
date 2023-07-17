import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/respohome/Comonappbar/appbar.dart';
import 'package:reg_login/app/respohome/Responsive.dart';
import 'package:reg_login/app/respohome/pofile_respo.dart';
import '../../data/components/controllers/auth_controllers.dart';
import '../../data/components/controllers/posts_controller.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../modules/screens/home/views/widgets/friends_widget.dart';
import '../../modules/screens/profile/friends_profile.dart';

class RespoFriendsProfile extends StatefulWidget {
  int userId;
  RespoFriendsProfile({super.key, required this.userId});

  // final String title;

  @override
  State<RespoFriendsProfile> createState() => _RespoFriendsProfileState();
}

// final profileController = Get.find<ProfileController>();

class _RespoFriendsProfileState extends State<RespoFriendsProfile> {
  final postsController = Get.find<PostsController>();
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();
  @override
  void initState() {
    super.initState();
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    print("---------------here-------------------->>");
    profileController.getProfile();
  }

  getValues() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      postsController.getAllPost();
      await postsController.getProfile();
    });
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
                  flex: size.width > 1340 ? 8 : 10,
                  child: FriendsProfileScreen(
                    userId: postsController.allPostList[index].user.id,
                  ),
                  //  HomeContainer()
                ),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10,
                    child: FriendsProfileScreen(
                      userId: widget.userId,
                    )),
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
                    flex: size.width > 1340 ? 7 : 9,
                    child: FriendsProfileScreen(
                      userId: widget.userId,
                    )),
                kwidth10,
                Expanded(
                    flex: size.width > 1340 ? 3 : 5,
                    child: HomeFriendsWidget()),
                kwidth10
              ],
            )));
  }
}
