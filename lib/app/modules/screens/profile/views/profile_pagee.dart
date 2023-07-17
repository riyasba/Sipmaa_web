import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/continers/comentcontiner.dart';
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
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(8)),
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      child: GetBuilder<ProfileController>(builder: (_) {
        return ListView(
          primary: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [ksizedbox10,
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.874,
                      child: Container(
                          color: kwhite,
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.874,
                          child: profileController
                                      .profileData.first.user.backgroundImage ==
                                  null
                              ? Image.asset(
                                  'assets/images/Rectangle 800.png',
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  profileController
                                      .profileData.first.user.backgroundImage,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          // Pick an image
                          final XFile? timage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          var imagePath = await timage!.readAsBytes();

                          profileController.updateProfileBackgoundPic(
                              media: imagePath);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 100, left: size.width * 0.20),
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            child: Stack(
                              children: [
                                Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100)),
                                  child: profileController.isLoading.isTrue
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : profileController.profileData.isEmpty
                                          ? Container()
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: profileController
                                                          .profileData
                                                          .first
                                                          .user
                                                          .profilePicture ==
                                                      null
                                                  ? Image.asset(
                                                      'assets/images/propic.jpg',
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
                                 Container(
                                    height: 160,
                                    width: 160,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(
                                            "assets/icons/silver_badge.png")))
                              ],
                            ),
                          ),

                          //
                          Positioned(
                              bottom: 5,
                              right: -50,
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
                                      radius: 100,
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
                //     left: 50, child: Image.asset('assets/images/profile_icon.png'))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                  InkWell(
                    onTap: () {
                      Get.find<HomeController>().homeindex(6);
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kblue),
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

            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "About",
                    style: primaryfont.copyWith(
                        color: Color.fromARGB(214, 19, 18, 18),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  child: ReadMoreText(
                    profileController.profileData.first.user.bio ?? "",
                    trimLines: 2,
                    colorClickableText: Colors.black,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: ' show less',
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Designation",
                    style: primaryfont.copyWith(
                        color: Color.fromARGB(214, 19, 18, 18),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileController.profileData.first.user.designation ??
                        ""),
                  ],
                )),

            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Current Company",
                    style: primaryfont.copyWith(
                        color: const Color.fromARGB(214, 19, 18, 18),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileController
                            .profileData.first.user.currentCompany ??
                        ""),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Previous Company",
                    style: primaryfont.copyWith(
                        color: const Color.fromARGB(214, 19, 18, 18),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Container(
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i <
                              profileController
                                  .profileData.first.positions.length;
                          i++)
                        Text(
                            "${profileController.profileData.first.positions[i].companyName},"),
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Skills",
                    style: primaryfont.copyWith(
                        color: const Color.fromARGB(214, 19, 18, 18),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Container(
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i < profileController.profileData.first.skills.length;
                          i++)
                        Text(
                            "${profileController.profileData.first.skills[i].name},"),
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Text(
                    'All Post',
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
                              Get.find<PostsController>().getComments(
                                  postId: profileController
                                      .profileData.first.posts[index].id
                                      .toString());

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 350,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.53,
                                                decoration: BoxDecoration(
                                                    color: kwhite),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Row(
                                                        children: [
                                                          profileController
                                                                      .profileData
                                                                      .first
                                                                      .posts[
                                                                          index]
                                                                      .body ==
                                                                  ""
                                                              ? Container(
                                                                  width:
                                                                      size.width *
                                                                          0.3,
                                                                  height:
                                                                      size.height *
                                                                          0.4,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                )
                                                              : Image.network(
                                                                  profileController
                                                                      .profileData
                                                                      .first
                                                                      .posts[
                                                                          index]
                                                                      .body,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  width:
                                                                      size.width *
                                                                          0.3,
                                                                  height:
                                                                      size.height *
                                                                          0.4,
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 35,
                                                              left: 20),
                                                      child: Container(
                                                        height: 300,
                                                        width: 250,
                                                        child: GetBuilder<
                                                                PostsController>(
                                                            builder: (_) {
                                                          return Get.find<
                                                                      PostsController>()
                                                                  .commentsList
                                                                  .isEmpty
                                                              ? Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          20),
                                                                  child: Center(
                                                                    child: const Text(
                                                                        "No Comments yet!"),
                                                                  ),
                                                                )
                                                              : ListView
                                                                  .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemBuilder: (context,
                                                                          index) =>
                                                                      comentsContainer(
                                                                    commentsList:
                                                                        Get.find<PostsController>()
                                                                            .commentsList[index],
                                                                  ),
                                                                  itemCount: Get
                                                                          .find<
                                                                              PostsController>()
                                                                      .commentsList
                                                                      .length,
                                                                );
                                                        }),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                left: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: const Icon(
                                                    Icons.arrow_back,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                right: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    _deletePromt(
                                                        context,
                                                        profileController
                                                            .profileData
                                                            .first
                                                            .posts[index]
                                                            .id
                                                            .toString());
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: profileController.profileData.first
                                            .posts[index].body ==
                                        ""
                                    ? Text(profileController
                                        .profileData.first.posts[index].title)
                                    : Image.network(
                                        profileController.profileData.first
                                            .posts[index].body,
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

  _deletePromt(BuildContext context, String postId) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (builder) {
          return Container(
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
                    const SizedBox(
                      width: 40,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: kblue, width: 1),
                            minimumSize: const Size(110, 40),
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
}
