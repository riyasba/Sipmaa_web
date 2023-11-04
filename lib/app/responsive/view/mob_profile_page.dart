import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/textfield.dart';
import 'package:reg_login/app/modules/screens/profile/views/education_skills_update_page.dart';
import 'package:reg_login/app/responsive/view/post_view/post_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/posts_controller.dart';
import '../../data/components/controllers/profile_controller.dart';

class MobProfilePage extends StatefulWidget {
  const MobProfilePage({super.key});

  @override
  State<MobProfilePage> createState() => _MobProfilePageState();
}

class _MobProfilePageState extends State<MobProfilePage> {

  List<String> educationList = [
    "10th",
    "12th",
    "PUC",
    "UG",
    "PG",
    "Certificates / Others"
  ];

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
          return Container(
            height: 162,
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                ),
                 Center(
                    child:  Text(
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
          return  Container(
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
  final authController = Get.find<AuthController>();
  // final postsController = Get.find<PostsController>();
  @override
  void initState() {
    super.initState();
    profileController.getEducationalSkillsApi();
    profileController.getProfile();
  }

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  var institutenameController = TextEditingController();
  var certificateController = TextEditingController();
  var cCityController = TextEditingController();
  var cStateController = TextEditingController();
  var cDurationController = TextEditingController();
  var cCourseController = TextEditingController();

  String selectdt =
      formatDate(DateTime.now().subtract(const Duration(days: 0)), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);

  String selectdt1 = formatDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      [yyyy, "-", mm, "-", dd]);

  _showStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        authController.date1 = picked;
        selectdt =
            formatDate(authController.date1.subtract(const Duration(days: 0)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      authController.update();
    }
  }

  _showEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        authController.date = picked;
        selectdt1 =
            formatDate(authController.date.add(const Duration(days: 0)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
    }
    authController.update();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              Stack(
                children: [
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
                            profileController.profileData.first.user.designation ?? ""),
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
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
                      "About me",
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
                      "Designation",
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
                              .profileData.first.user.designation ??
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Text(
                      "Education",
                      style: primaryfont.copyWith(
                          color: const Color.fromARGB(214, 19, 18, 18),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  kwidth10,
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                         InkWell(
                          onTap: (){
                           // _showDialog();
                           educationPopup();
                          },
                          child: const Icon(Icons.add,color: Colors.grey,)),
                         const SizedBox(width: 20,),
                         InkWell(
                          onTap: (){
                            Get.to(const EducationSkillsUpdatePage());
                          },
                          child: const Icon(Icons.edit,size: 20,color: Colors.grey,)),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GetBuilder<ProfileController>(builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ksizedbox10,
                        profileController.educationskillsData.isEmpty
                            ? const Text('No data')
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: profileController
                                    .educationskillsData.length,
                                itemBuilder: (context, intex) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            if (profileController
                                                    .educationskillsData[intex]
                                                    .flag ==
                                                "student")
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 2,
                                                          color: Colors.grey
                                                              .withOpacity(0.5))
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(
                                                      "assets/icons/open-book.svg"),
                                                ),
                                              ),
                                            if (profileController
                                                    .educationskillsData[intex]
                                                    .flag ==
                                                "college")
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 2,
                                                          color: Colors.grey
                                                              .withOpacity(0.5))
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(
                                                      "assets/icons/graduation-hat.svg"),
                                                ),
                                              ),
                                            if (profileController
                                                    .educationskillsData[intex]
                                                    .flag ==
                                                "institute")
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 2,
                                                          color: Colors.grey
                                                              .withOpacity(0.5))
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(
                                                      "assets/icons/certificate.svg"),
                                                ),
                                              ),
                                            if (profileController
                                                    .educationskillsData[intex]
                                                    .flag ==
                                                null)
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  profileController
                                                      .educationskillsData[
                                                          intex]
                                                      .institutionName,
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  profileController
                                                      .educationskillsData[
                                                          intex]
                                                      .educationTitle,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                                Text(profileController
                                                    .educationskillsData[intex]
                                                    .tillDate
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                        // Text(profileController
                        //         .profileData.first.user.education ??
                        //     ""),
                      ],
                    );
                  })),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i <
                                profileController
                                    .profileData.first.positions.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profileController.profileData.first
                                      .positions[i].companyName
                                      .toUpperCase(),
                                  style: primaryfont.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  profileController.profileData.first
                                              .positions[i].departmentName ==
                                          "Others"
                                      ? profileController.profileData.first
                                          .positions[i].otherDepartmentName
                                      : profileController.profileData.first
                                          .positions[i].departmentName,
                                  style: primaryfont.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${profileController.profileData.first.positions[i].location}.",
                                  style: primaryfont.copyWith(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${profileController.profileData.first.positions[i].startDate} - ${profileController.profileData.first.positions[i].endDate == "" ? "On going" : profileController.profileData.first.positions[i].endDate} ",
                                  style: primaryfont.copyWith(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${profileController.profileData.first.positions[i].employmentType}.",
                                  style: primaryfont.copyWith(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                const Divider(
                                  thickness: 0.5,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              // const Divider(
              //   thickness: 1,
              // ),
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
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.profileData.first.skills.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4, crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 3, left: 3, bottom: 5),
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(50)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              profileController
                                  .profileData.first.skills[index].name,
                              style: primaryfont.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
                      ],
                    ),
              const Padding(
                padding:  EdgeInsets.only(left: 25, top: 25),
                child: Row(
                  children:  [
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
                          }),
            ],
          ),
        );
      })),
    );
  }

   var schoolController = TextEditingController();
  var standardsController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var startdateController = TextEditingController();
  var enddateController = TextEditingController();

  var univercitynameController = TextEditingController();
  var collageugController = TextEditingController();
  var ugcityController = TextEditingController();
  var stateugController = TextEditingController();
  var specialiseddegreeController = TextEditingController();
  var starttdateugController = TextEditingController();
  var enddateugController = TextEditingController();

  var univercitynamepgController = TextEditingController();
  var collagepgController = TextEditingController();
  var pgcityController = TextEditingController();
  var statepgController = TextEditingController();
  var pgspecialiseddegreeController = TextEditingController();
  var starttdatepgController = TextEditingController();
  var enddatepgController = TextEditingController();
  var insitituteController = TextEditingController();
  var durationController = TextEditingController();
  var courseController = TextEditingController();

  educationPopup(){
    showDialog(
              context: context,
                            builder: (BuildContext context) {
                              return Obx( () =>
                                 AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        18.0), // Adjust the radius as needed
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Fill Your Education Details'),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red[500],
                                          ))
                                    ],
                                  ),
                                  content:const Text('Choose your education and update the required details.'),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          //  ksizedbox10,
                                          Container(
                                  height: 56,
                                  child: DropdownSearch<String>(
                                    itemAsString: (String u) => u,
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: false,
                                      showSearchBox: true,
                                      menuProps: MenuProps(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      searchFieldProps: const TextFieldProps(),
                                    ),
                                    items: educationList,
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          // labelText: "Department *",
                                          hintText: "Select education",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        profileController.educationlist(value);
                                        standardsController.text = value.toString();
                                      });
                                    },
                                    // selectedItem: selectedState,
                                  ),
                                ),          
                                          if(profileController.educationlist.value == "10th" || profileController.educationlist.value == "12th")
                                          ksizedbox10,
                                          if(profileController.educationlist.value == "10th" || profileController.educationlist.value == "12th")
                                          TextFormFieldWidget(
                                            labeltext: 'School name',
                                            controller: schoolController,
                                          ),
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG" || profileController.educationlist.value == "PUC")
                                          ksizedbox10,
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG" || profileController.educationlist.value == "PUC")
                                          TextFormFieldWidget(
                                            controller: schoolController,
                                            labeltext: 'University name',
                                          ),
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG" || profileController.educationlist.value == "PUC")
                                          ksizedbox10,
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG" || profileController.educationlist.value == "PUC")
                                          TextFormFieldWidget(
                                            controller: collagepgController,
                                            labeltext: 'College',
                                          ),
                                          if(profileController.educationlist.value == "Certificates / Others")
                                          ksizedbox10,
                                           if(profileController.educationlist.value == "Certificates / Others")
                                          TextFormFieldWidget(
                                          controller: schoolController,
                                          labeltext: 'Institution Name',
                                        ),
                                         if(profileController.educationlist.value == "Certificates / Others")
                                        ksizedbox10,
                                         if(profileController.educationlist.value == "Certificates / Others")
                                        TextFormFieldWidget(
                                          controller: courseController,
                                          labeltext: 'Course Name',
                                        ),
                                         if(profileController.educationlist.value == "Certificates / Others")
                                        ksizedbox10,
                                          if(profileController.educationlist.value == "Certificates / Others")
                                           TextFormFieldWidget(
                                            controller: durationController,
                                            labeltext: 'Duration',
                                          ),
                                          if(profileController.educationlist.value == "Certificates / Others")
                                          ksizedbox10,
                                          if(profileController.educationlist.value == "Certificates / Others")
                                          TextFormFieldWidget(
                                            labeltext: 'Course / Certificate',
                                            controller: certificateController,
                                          ),
                                          // TextFormFieldWidget(
                                          //   labeltext: 'Standards',
                                          //   controller: standardsController,
                                          // ),
                                          // ksizedbox10,
                                          ksizedbox10,
                                          TextFormFieldWidget(
                                            labeltext: 'City',
                                            controller: cityController,
                                          ),
                                          ksizedbox10,
                                          TextFormFieldWidget(
                                            labeltext: ' State',
                                            controller: stateController,
                                          ),
                                          ksizedbox10,
                                          GetBuilder<AuthController>(
                                            builder: (_) {
                                              return Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      _showStartDate(context);
                                                    },
                                                    child: Container(
                                                      width: 120,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[100],
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          selectdt
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'To',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: kgrey),
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      _showEndDate(context);
                                                    },
                                                    child: Container(
                                                      width: 120,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[100],
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Center(
                                                        child: selectdt1 == formatDate(
                                                        DateTime(DateTime.now().year, 
                                                        DateTime.now().month, DateTime.now().day),
                                                        [yyyy, "-", mm, "-", dd])
                                                         ? const Text("Till Date") : Text(selectdt1),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          ),
                                          ksizedbox10,
                                          InkWell(
                                            onTap: () {
                                              var flag = "";
                                              if(standardsController.text == "10th" || standardsController.text == "12th"){
                                                flag = "student";
                                              }else if(standardsController.text == "UG" || standardsController.text == "PG" || standardsController.text == "PUC"){
                                                flag = "college";
                                              }else{
                                                flag = "institute";
                                              }
                                              
                                              print(
                                                  "-------->> chack values <<---------");
                                              print(schoolController.text);
                                              print(standardsController.text);
                                              authController.addEducationalSkills(
                                                  flag: flag,
                                                  institutionname: schoolController.text,
                                                  userId: "",
                                                  educationtitle: standardsController.text,
                                                  city: cityController.text,
                                                  state: stateController.text,
                                                  frombatch: selectdt,
                                                  tilldate: selectdt1 == formatDate(
                                                  DateTime(DateTime.now().year, 
                                                  DateTime.now().month, DateTime.now().day),
                                                  [yyyy, "-", mm, "-", dd]) ? "Till Date" : selectdt,
                                                  educationdescription: certificateController.text);
                                                 profileController.getEducationalSkillsApi(); 
                                              //   Get.back();
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: kblue,
                                                  borderRadius:
                                                      BorderRadius.circular(16)),
                                              child: Center(
                                                  child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: kwhite),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
   }

}
