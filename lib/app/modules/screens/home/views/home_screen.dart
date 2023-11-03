import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/modules/screens/home/views/chat.dart';
import 'package:reg_login/app/modules/screens/home/views/create_widget.dart';
import 'package:reg_login/app/modules/screens/home/views/notification_widget.dart';
import 'package:reg_login/app/modules/screens/Settings/views/settingss.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/friends_search_screen.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/textfield.dart';
import 'package:reg_login/app/modules/screens/profile/views/profile_pagee.dart';
import 'package:reg_login/app/modules/screens/home/views/searchcontainer.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import 'widgets/friends_widget.dart';
import '../controler/controler.dart';
import 'filter_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController textController = TextEditingController();

class _HomePageState extends State<HomePage> {
  int index = 0;
  final homeController = Get.find<HomeController>();
  final postsController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();

  List<String> educationList = [
    "10th",
    "12th",
    "PUC",
    "UG",
    "PG",
    "Certificates / Others"
  ];

  @override
  void initState() {
    super.initState();
    postsController.getAllPost();
    profileController.getProfile();
    userTypeUpdate();
  }

  educationPopup() async {
    await profileController.getEducationalSkillsApi();
    if (profileController.educationskillsData.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 50));
      _educationPopup();

    }
  }

  userTypeUpdate() async {
    print("............this is home popup");
   await profileController.getProfile();
   if(profileController.profileData.isNotEmpty){
      if(profileController.profileData.first.user.userType != "null"){
      await Future.delayed(const Duration(milliseconds: 50));
     _usertypPopup();
    }else{
      educationPopup();
    }
   }
  }

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

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

  var institutenameController = TextEditingController();
  var certificateController = TextEditingController();
  var cCityController = TextEditingController();
  var cStateController = TextEditingController();
  var cDurationController = TextEditingController();
  var cCourseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: const Color(0xffCAE1FF),
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
              onPressed: () {
                homeController.homeindex(7);
                homeController.update();
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                homeController.homeindex(3);
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
          InkWell(
            onTap: () {
              homeController.homeindex(4);
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
                                backgroundImage: AssetImage(
                                    'assets/images/profile_icon.png'),
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
      ),
      body: Row(
        children: [
          Obx(
            () => Container(
              width: size.width * 0.13,
              color: kblue,
              child: Column(
                children: [
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    50),
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 0
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              homeController.homeindex(0);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: homeController.homeindex.value == 0
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        color:
                                            homeController.homeindex.value == 0
                                                ? kblue
                                                : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    50),
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 1
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              homeController.homeindex(1);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: homeController.homeindex == 1
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 6),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                        color: homeController.homeindex == 1
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.95, 50),
                              elevation: 0,
                              backgroundColor: homeController.homeindex == 2
                                  ? kwhite
                                  : kblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              homeController.homeindex(2);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_alt_rounded,
                                  color: homeController.homeindex == 2
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 6),
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(
                                        color: homeController.homeindex == 2
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    50),
                                elevation: 0,
                                backgroundColor: homeController.homeindex == 3
                                    ? kwhite
                                    : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              homeController.homeindex(3);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: homeController.homeindex == 3
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 6),
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                        color: homeController.homeindex == 3
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    50),
                                elevation: 0,
                                backgroundColor: homeController.homeindex == 4
                                    ? kwhite
                                    : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              homeController.homeindex(4);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: homeController.homeindex == 4
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 6),
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                        color: homeController.homeindex == 4
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25, top: 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.95, 50),
                            elevation: 0,
                            backgroundColor: homeController.homeindex.value == 5
                                ? kwhite
                                : kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          homeController.homeindex(5);
                          homeController.update();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: homeController.homeindex == 5
                                  ? kblue
                                  : kwhite,
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(top: 0, left: 6),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                    color: homeController.homeindex == 5
                                        ? kblue
                                        : kwhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    50),
                                elevation: 0,
                                backgroundColor:
                                    homeController.homeindex.value == 6
                                        ? kwhite
                                        : kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              homeController.homeindex(6);
                              homeController.update();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_search,
                                  color: homeController.homeindex == 6
                                      ? kblue
                                      : kwhite,
                                ),
                                ksizedbox10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 6),
                                  child: Text(
                                    'Friends',
                                    style: TextStyle(
                                        color: homeController.homeindex == 6
                                            ? kblue
                                            : kwhite,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.95, 50),
                              elevation: 0,
                              backgroundColor:
                                  homeController.homeindex.value == 8
                                      ? kwhite
                                      : kblue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            homeController.homeindex(8);
                            homeController.update();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.message,
                                color: homeController.homeindex == 8
                                    ? kblue
                                    : kwhite,
                              ),
                              ksizedbox10,
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 6),
                                child: Text(
                                  'Chats',
                                  style: TextStyle(
                                      color: homeController.homeindex == 8
                                          ? kblue
                                          : kwhite,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(52, 52),
                          backgroundColor: kwhite.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: kwhite,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        ksizedbox10,
                                        const Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Do you want to Logout ?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        ksizedbox30,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 80,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFF3C73B1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.toNamed('/sign-in');
                                                  },
                                                  // Get.to(

                                                  // BottomNavigationBarExample(),
                                                  //);

                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              width: 80,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(
                                                      0xFF3C73B1,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  // Get.to(

                                                  // BottomNavigationBarExample(),
                                                  //);

                                                  child: const Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 0),
                            child: Icon(
                              Icons.power_settings_new,
                              size: 17,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0, left: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Log out',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 1),
                                //   child: Text(
                                //     'Developer',
                                //     style: TextStyle(
                                //         fontSize: 8,
                                //         color: Colors.black,
                                //         fontWeight: FontWeight.w800),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              // width: 135
              width: homeController.homeindex == 2 ||
                      homeController.homeindex.value == 4
                  ? 0
                  : 135,
            ),
          ),
          Obx(
            () => Row(
              children: [
                if (homeController.homeindex.value == 0) HomeContainer(),
                if (homeController.homeindex.value == 1) SearchContainer(),
                if (homeController.homeindex.value == 2) FillterWidget(),
                if (homeController.homeindex.value == 3) NotificationWidget(),
                if (homeController.homeindex.value == 4) ProfileScreen(),
                if (homeController.homeindex.value == 5) CreateWidget(),
                if (homeController.homeindex.value == 6) FriendsSearch(),
                if (homeController.homeindex.value == 7) SettingsPage(),
                if (homeController.homeindex.value == 8) Chat(),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              // width: 135
              width: homeController.homeindex == 2
                  ? 100
                  : homeController.homeindex == 4
                      ? 0
                      : 135,
            ),
          ),
          Obx(
            () => Row(
              children: [
                if (homeController.homeindex.value != 4 &&
                    homeController.homeindex.value != 7)
                  HomeFriendsWidget()
              ],
            ),
          ),
        ],
      ),
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
  var courseController = TextEditingController();
  var durationController = TextEditingController();
  

  _educationPopup(){
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
                                                        child:selectdt1 == formatDate(
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
                                              }else if(standardsController.text == "UG" || standardsController.text == "PG" || standardsController.text == "PUC" ){
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

                       _usertypPopup(){
                       showDialog(
                            context: context,
                            barrierDismissible: false,
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
                                      InkWell(
                                        onTap: (){
                                          authController.wayIndex(0);
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: authController.wayIndex.value == 0 ? kblue : kwhite,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text("Student",
                                             style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: authController.wayIndex.value == 0 ? kwhite : kblue),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          authController.wayIndex(1);
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color:authController.wayIndex.value == 0 ? kwhite : kblue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text("Professional",
                                             style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color:authController.wayIndex.value == 0 ? kblue : kwhite),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  content:const Text(
                                         'Would you like to be a  __________',
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                        ),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          InkWell(
                    onTap: () {
                      authController.professinalindex(0);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kgrey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // kwidth10,
                            const Text(
                              'Mentor',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            authController.professinalindex.value == 0
                                ? Icon(
                                    Icons.check_circle,
                                    color: kblue,
                                    size: 28,
                                  )
                                : Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                            //   kwidth10
                          ],
                        ),
                      ),
                    ),
                  ),
                  ksizedbox10,
                  ksizedbox10,
                  if(authController.wayIndex == 1)
                  InkWell(
                    onTap: () {
                      authController.professinalindex(1);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kgrey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // kwidth10,
                            const Text(
                              'Trainer',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            authController.professinalindex.value == 1
                                ? Icon(
                                    Icons.check_circle,
                                    color: kblue,
                                    size: 28,
                                  )
                                : Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                            //   kwidth10
                          ],
                        ),
                      ),
                    ),
                  ),
                  if(authController.wayIndex == 0)
                  InkWell(
                    onTap: () {
                      authController.professinalindex(1);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kgrey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // kwidth10,
                            const Text(
                              'Training',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            authController.professinalindex.value == 1
                                ? Icon(
                                    Icons.check_circle,
                                    color: kblue,
                                    size: 28,
                                  )
                                : Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                            //   kwidth10
                          ],
                        ),
                      ),
                    ),
                  ),
                  ksizedbox10,
                  ksizedbox10,
                  if(authController.wayIndex == 0)
                  InkWell(
                    onTap: () {
                      authController.professinalindex(2);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kgrey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // kwidth10,
                            const Text(
                              'Certification',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            authController.professinalindex.value == 2
                                ? Icon(
                                    Icons.check_circle,
                                    color: kblue,
                                    size: 28,
                                  )
                                : Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                            //   kwidth10
                          ],
                        ),
                      ),
                    ),
                  ), 
                  if(authController.wayIndex == 1)
                  InkWell(
                    onTap: () {
                      authController.professinalindex(2);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kgrey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // kwidth10,
                            const Text(
                              'Guide',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            authController.professinalindex.value == 2
                                ? Icon(
                                    Icons.check_circle,
                                    color: kblue,
                                    size: 28,
                                  )
                                : Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                            //   kwidth10
                          ],
                        ),
                      ),
                    ),
                  ), 
                                          ksizedbox30,
                                          InkWell(
                                            onTap: () {
                                              var type;
                                              if(authController.wayIndex.value == 0){
                                                if(authController.professinalindex.value == 0){
                                                type = "Mentor";
                                              }else if(authController.professinalindex.value == 1){
                                                type = "Training";
                                              }else if(authController.professinalindex.value == 2){
                                                type = "Certification";
                                              }
                                              authController.eStudentProfessionaltype(type: type);
                                              } else {
                                                if(authController.professinalindex.value == 0){
                                                  type = "Mentor";
                                                }else if(authController.professinalindex.value == 1){
                                                  type = "Trainer";
                                                }else if(authController.professinalindex.value == 2){
                                                  type = "Guide";
                                                }
                                                authController.eStudentProfessionaltype(type: type);
                                              }
                                              authController.updateUserType(userType: authController.wayIndex.value == 0 ? "Student" : "Professional");
                                              educationPopup();
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
