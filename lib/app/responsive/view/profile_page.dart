import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/responsive/view/post_view/post_view.dart';
import 'package:reg_login/app/responsive/view/public_profle_view/setting_proifile_page.dart';
import 'package:reg_login/app/responsive/view/setting_privacy.dart';
import 'package:reg_login/app/responsive/view/setting_proifile_page.dart';
import 'package:reg_login/app/responsive/view/setting_term_condition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/posts_controller.dart';
import '../../data/components/controllers/profile_controller.dart';
import '../widgets/bottumnavigationbar.dart';
import '../widgets/comonmobappbar.dart';
import '../widgets/drawer.dart';
import 'change_password.dart';
import 'home_respo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List postimage = [
    'assets/images/searchimage.png',
    'assets/images/searchimage.png',
    'assets/images/searchimage.png',
    'assets/images/searchimage.png',
    'assets/images/searchimage.png',
    'assets/images/searchimage.png'
  ];
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
                          //      Get.to(loginpage());
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

  void _showDeletePostOptions(String postId) {
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
                Center(
                    child: Text(
                  "Do you want to Delete this post?",
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
                          Get.find<PostsController>()
                              .deletePost(postId: postId);
                        },
                        child: Text(
                          'Delete',
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

  final postController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();
  // final postsController = Get.find<PostsController>();
  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: ComenappBarmob(),
      // ),
      // drawer: MobileDrawer(),
      backgroundColor: kwhite,
      // appBar: AppBar(
      //   backgroundColor: kblue,
      //   title: Text(
      //     'Profile',
      //     style: TextStyle(color: kwhite),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: GestureDetector(
      //         onTap: () {
      //           showModalBottomSheet(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16)),
      //               context: context,
      //               builder: (context) {
      //                 return Column(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: <Widget>[
      //                     Container(
      //                       decoration: const BoxDecoration(
      //                           borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(50),
      //                         topRight: Radius.circular(50),
      //                       )),
      //                       child: Row(
      //                         children: const [
      //                           Padding(
      //                             padding: EdgeInsets.only(left: 20, top: 6),
      //                             child: Text(
      //                               'Settings',
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     ListTile(
      //                       leading: const Icon(Icons.person_outlined),
      //                       title: const Text(
      //                         'Profile',
      //                         style: TextStyle(fontWeight: FontWeight.bold),
      //                       ),
      //                       onTap: () {
      //                         Get.to(const SettingProfilePage());
      //                       },
      //                     ),
      //                     ListTile(
      //                       leading: Icon(Icons.key),
      //                       // leading: SvgPicture.asset(
      //                       //   'assets/images/key.svg',
      //                       // ),
      //                       title: const Text(
      //                         'Change Password',
      //                         style: TextStyle(fontWeight: FontWeight.bold),
      //                       ),
      //                       onTap: () {
      //                         Get.to(const ChangePasswordPage());
      //                       },
      //                     ),
      //                     ListTile(
      //                       leading: const Icon(Icons.privacy_tip),
      //                       title: const Text(
      //                         'Privacy',
      //                         style: TextStyle(fontWeight: FontWeight.bold),
      //                       ),
      //                       onTap: () {
      //                         Get.to(const SettingprivacyPage());
      //                       },
      //                     ),
      //                     ListTile(
      //                       leading: const Icon(Icons.document_scanner),
      //                       title: const Text(
      //                         'Terms & Conditions',
      //                         style: TextStyle(fontWeight: FontWeight.bold),
      //                       ),
      //                       onTap: () {
      //                         Get.to(const SettingTermConditionPage());
      //                       },
      //                     ),
      //                     ListTile(
      //                       leading: const Icon(Icons.logout),
      //                       title: const Text(
      //                         'Logout',
      //                         style: TextStyle(fontWeight: FontWeight.bold),
      //                       ),
      //                       onTap: () {
      //                         Navigator.of(context).pop();
      //                         _showModalSheet();
      //                       },
      //                     ),
      //                   ],
      //                 );
      //               });
      //         },
      //         child: const Icon(Icons.settings),
      //         //  child: ksettingsicon
      //       ),
      //     ),
      //   ],
      //   elevation: 0,
      // ),
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
                    'assets/images/Rectangle 800.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, right: 10, left: 20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: profileController.isLoading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : profileController.profileData.isEmpty
                                ? Container()
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: profileController.profileData.first
                                                .user.profilePicture ==
                                            null
                                        ? Image.asset(
                                            "assets/images/profile.png",
                                          )
                                        : Image.network(
                                            profileController.profileData.first
                                                .user.profilePicture,
                                          ),
                                  ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 168,
                    left: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 155, top: 8),
                      child: GestureDetector(
                        onTap: () async {
                          var imagePath;
                          PickedFile? pickedFile = await ImagePicker().getImage(
                            source: ImageSource.gallery,
                          );
                          imagePath = await pickedFile!.readAsBytes();

                          profileController.updateProfilePic(media: imagePath);
                        },
                        child: Container(
                          height: 26.5,
                          child: const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/profileicon.png'),
                              backgroundColor: Colors.white,
                              child: Icon(Icons.add)),
                        ),
                      ),
                    ))
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2),
                child: profileController.profileData.isEmpty
                    ? Container()
                    : Text(
                        '${profileController.profileData.first.user.name} ${profileController.profileData.first.user.lastName}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
              ),
              profileController.profileData.isEmpty
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            profileController.profileData.first.user.bio ?? ""),
                      ],
                    ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, left: 120, right: 135),
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(18)),
              //           backgroundColor: kblue,
              //           minimumSize: Size(50, 40)),
              //       onPressed: () {},
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.asset('assets/images/iconimage.png'),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           const Text(
              //             'Request',
              //             style: TextStyle(color: Colors.white),
              //           )
              //         ],
              //       )),
              // ),
              const SizedBox(
                height: 20,
              ),
              profileController.profileData.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              profileController.profileData.first.totalFriends
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              profileController.profileData.first.totalPosts
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              profileController.profileData.first.totalLikes
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
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
                  children: const [
                    Text(
                      'Post',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              profileController.profileData.isEmpty
                  ? Container()
                  : profileController.profileData.first.posts.isEmpty
                      ? Center(
                          child: Image.asset("assets/icons/no_post.png"),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount:
                              profileController.profileData.first.posts.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => PostView(
                                    postData: profileController
                                        .profileData.first.posts[index]));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Image.network(profileController
                                    .profileData.first.posts[index].body),
                              ),
                            );
                          })
            ],
          ),
        );
      })),
    );
  }
}
