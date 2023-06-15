import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';

import '../../../../data/components/constands/constands.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

int index = 0;
List postimage = [
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Rectangle 807.png'
];

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: MediaQuery.of(context).size.width * 0.874,
      child: GetBuilder<ProfileController>(builder: (_) {
        return ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                    color: kwhite,
                    width: MediaQuery.of(context).size.width * 0.874,
                    child: Image.asset(
                      'assets/images/Rectangle 800.png',
                      fit: BoxFit.fill,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            child: Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: profileController.isLoading.isTrue
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : profileController.profileData.isEmpty
                                      ? Container()
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: profileController
                                                      .profileData
                                                      .first
                                                      .user
                                                      .profilePicture ==
                                                  null
                                              ? Image.asset(
                                                  "assets/images/profile.png",
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  profileController
                                                      .profileData
                                                      .first
                                                      .user
                                                      .profilePicture,
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                            ),
                          ),

                          //
                          Positioned(
                              bottom: 5,
                              right: 10,
                              child: InkWell(
                                onTap: () async {
                                  var imagePath;
                                  PickedFile? pickedFile =
                                      await ImagePicker().getImage(
                                    source: ImageSource.gallery,
                                  );
                                  imagePath = await pickedFile!.readAsBytes();

                                  profileController.updateProfilePic(
                                      media: imagePath);
                                },
                                child: Container(
                                  height: 26.5,
                                  child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/images/profileicon.png'),
                                      backgroundColor: Colors.grey,
                                      child: Icon(Icons.add)),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),

                // Positioned(
                //     left: 50, child: Image.asset('assets/images/createprofile.png'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileController.profileData.isEmpty
                      ? Container()
                      : Text(
                          '${profileController.profileData.first.user.name} ${profileController.profileData.first.user.lastName}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  ksizedbox10,
                  profileController.profileData.isEmpty
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(profileController.profileData.first.user.bio ??
                                ""),
                          ],
                        ),
                ],
              ),
            ),
            ksizedbox40,
            Container(
              width: MediaQuery.of(context).size.width * 0.874,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kblue),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Friends',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          profileController.profileData.isEmpty
                              ? Container()
                              : Text(
                                  profileController
                                      .profileData.first.totalFriends
                                      .toString(),
                                  style: TextStyle(
                                      color: kwhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kblue),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Poster',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          profileController.profileData.isEmpty
                              ? Container()
                              : Text(
                                  profileController.profileData.first.totalPosts
                                      .toString(),
                                  style: TextStyle(
                                      color: kwhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kblue),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Likes',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          profileController.profileData.isEmpty
                              ? Container()
                              : Text(
                                  profileController.profileData.first.totalLikes
                                      .toString(),
                                  style: TextStyle(
                                      color: kwhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'ALL Post',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ksizedbox30,
            // Container(
            //     height: 500,
            //     child: GridView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //         itemCount: postimage.length,
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 4,
            //             mainAxisSpacing: 30,
            //             crossAxisSpacing: 30),
            //         itemBuilder: (context, index) {
            //           return Container(
            //             color: Colors.white,
            //             child: Image.asset(postimage[index]),
            //           );
            //         }))

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
                              // Get.to(() => PostView(
                              //     postData: profileController
                              //         .profileData.first.posts[index]));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: Image.network(
                                  profileController
                                      .profileData.first.posts[index].body,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        })
          ],
        );
      }),
    );
  }
}
