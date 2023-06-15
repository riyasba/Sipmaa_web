import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/components/constands/constands.dart';
import '../../../data/components/controllers/profile_controller.dart';


class PublicProfileView extends StatefulWidget {
  int userId;
  PublicProfileView({super.key, required this.userId});

  @override
  State<PublicProfileView> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<PublicProfileView> {
  void _showModalSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (builder) {
          return new Container(
            height: 162,
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                ),
                new Center(
                    child: new Text(
                  "Do you want to LogOut?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString("auth_token", "null");
                     //     Get.to(loginpage());
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 15, color: kwhite),
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: kblue, width: 1),
                            minimumSize: Size(110, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, color: kblue),
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [],
        elevation: 0,
      ),
      body: SafeArea(child: GetBuilder<ProfileController>(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(children: [
                Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width,
                  color: kblue,
                  child: Image.asset(
                    'assets/images/searchimage.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: profileController.otherUserProfileData.first
                                      .user.profilePicture ==
                                  null
                              ? Image.asset(
                                  "assets/icons/profile_icon.png",
                                )
                              : Image.network(
                                  profileController.otherUserProfileData.first
                                      .user.profilePicture,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Positioned(
                //     top: 168,
                //     left: 50,
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 155, top: 8),
                //       child: Container(
                //         height: 26.5,
                //         child: CircleAvatar(
                //             radius: 30,
                //             backgroundImage:
                //                 AssetImage('assets/images/profileicon.png'),
                //             backgroundColor: Colors.grey,
                //             child: Icon(Icons.add)),
                //       ),
                //     ))
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2),
                child: Text(
                  profileController.otherUserProfileData.first.user.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 25),
                child: Text(
                        profileController.otherUserProfileData.first.user.bio ??
                            "")
                    ,
              ),
              if (profileController.otherUserProfileData.first.isFriend == 0)
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 120, right: 135),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          backgroundColor: kblue,
                          minimumSize: const Size(50, 40)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/iconimage.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Request',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${profileController.otherUserProfileData.first.totalFriends}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        '${profileController.otherUserProfileData.first.totalPosts}k',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        '${profileController.otherUserProfileData.first.totalLikes}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Friends',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Posters',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Row(
                  children: [
                    Text(
                      'Post',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(child: GetBuilder<ProfileController>(builder: (_) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: profileController
                        .otherUserProfileData.first.posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        child: Image.network(profileController
                            .otherUserProfileData.first.posts[index].body),
                      );
                    });
              }))
            ],
          ),
        );
      })),
    );
  }
}
