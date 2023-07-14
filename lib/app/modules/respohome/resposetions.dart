import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/modules/respohome/Responsive.dart';
import 'package:reg_login/app/modules/respohome/pofile_respo.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';

import '../../data/components/controllers/profile_controller.dart';
import '../screens/home/views/widgets/friends_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final profileController = Get.find<ProfileController>();

class _MyHomePageState extends State<MyHomePage> {
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
                    flex: size.width > 1340 ? 8 : 10, child: HomepageRespo()
                    //  HomeContainer()
                    ),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10, child: HomeContiners()),
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
                    flex: size.width > 1340 ? 7 : 9, child: HomeContiners()),
                kwidth10,
                Expanded(
                    flex: size.width > 1340 ? 3 : 5,
                    child: HomeFriendsWidget()),
                kwidth10
              ],
            )));
  }
}

class AppbarComn extends StatelessWidget {
  const AppbarComn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kwhite,
      //const Color(0xffCAE1FF),
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      actions: [
        // InkWell(
        //   onTap: (){
        //     homeController.homeindex(1);
        //                     homeController.update();
        //    // Get.to(FriendsSearch());
        //   },
        //   child: SearchWidget(
        //     textController: textController,
        //   ),
        // ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: Colors.black,
            )),
        kwidth10,
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            )),

        kwidth10,
        IconButton(
            onPressed: () {},
            // onPressed: () {
            //   homeController.homeindex(7);
            //   homeController.update();
            // },
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
            )),

        kwidth10,
        IconButton(
            onPressed: () {
              // homeController.homeindex(3);
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            )),

        kwidth10,
        InkWell(
          onTap: () {
            // homeController.homeindex(4);
          },
          child: GetBuilder<ProfileController>(
            builder: (_) {
              return profileController.profileData.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: profileController
                                  .profileData.first.user.profilePicture ==
                              null
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile_icon.png'),
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(profileController
                                  .profileData.first.user.profilePicture),
                            ),
                    );
            },
          ),
        ),
      ],
    );
  }
}

class new1 extends StatelessWidget {
  const new1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
    );
  }
}

class HomeContiners extends StatelessWidget {
  HomeContiners({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffCAE1FF), borderRadius: BorderRadius.circular(9)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
        ),
        child: HomeContainer(),
      ),
      width: size.width,
    );
  }
}
