import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/respohome/pofile_respo.dart';
import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../../modules/screens/home/views/widgets/friends_widget.dart';
import '../../responsive/view/public_profle_view/add_new_skills_page.dart';
import '../../responsive/view/public_profle_view/profile_add_new_possition_view.dart';
import '../Comonappbar/appbar.dart';
import '../Responsive.dart';

class RespAddSkills extends StatefulWidget {
  const RespAddSkills({
    super.key,
  });

  // final String title;

  @override
  State<RespAddSkills> createState() => _RespAddSkillsState();
}

final profileController = Get.find<ProfileController>();

class _RespAddSkillsState extends State<RespAddSkills> {
  @override
  void initState() {
    

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
                    flex: size.width > 1340 ? 8 : 10, child:Skils()
                    //  HomeContainer()
                    ),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Skils(),
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
                    flex: size.width > 1340 ? 7 : 9, child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Skils(),
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
class RespNewPosition extends StatefulWidget {
  const RespNewPosition({
    super.key,
  });

  // final String title;

  @override
  State<RespNewPosition > createState() => _RespNewPositionState();
}

//final profileController = Get.find<ProfileController>();

class _RespNewPositionState extends State<RespNewPosition> {
  @override
  void initState() {
    

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
                    flex: size.width > 1340 ? 8 : 10, child: POsitions()
                    //  HomeContainer()
                    ),
              ],
            ),
            tablet: Row(
              children: [
                Expanded(
                    flex: size.width > 1340 ? 8 : 10, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: POsitions(),
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
                    flex: size.width > 1340 ? 7 : 9, child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: POsitions(),
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
class Skils extends StatelessWidget {
  const Skils({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: kwhite,
      borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AddNewSkillsView(),
      ),);
  }
}

class POsitions extends StatelessWidget {
  const POsitions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: kwhite,
      borderRadius: BorderRadius.circular(8)),
      child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ProfileAddNewPossitonView(),
    ),);
  }
}