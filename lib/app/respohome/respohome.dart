import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets/textfield.dart';
import 'package:reg_login/app/respohome/Comonappbar/appbar.dart';
import 'package:reg_login/app/respohome/Responsive.dart';
import 'package:reg_login/app/respohome/pofile_respo.dart';
import 'package:reg_login/app/modules/screens/home/views/widgets.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';

import '../data/components/controllers/profile_controller.dart';
import '../modules/screens/home/views/widgets/friends_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {

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
    // TODO: implement initState

    super.initState();
    profileController.getNotificationList();
    profileController.getProfile();
     userTypeUpdate();
  }

  educationPopup() async {
    await profileController.getEducationalSkillsApi();
    if (profileController.educationskillsData.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 50));
      _educationPopup();

    }
  }

  userTypeUpdate() async {
    print("............this is home popup");
   await profileController.getProfile();
   if(profileController.profileData.isNotEmpty){
      if(profileController.profileData.first.user.userType == "null"){
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // key: _scaffoldKey,
      //  drawer: ProfileRespo(),
        backgroundColor:const Color(0xffCAE1FF),
        appBar:const PreferredSize(
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
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG")
                                          ksizedbox10,
                                          if(profileController.educationlist.value == "UG" || profileController.educationlist.value == "PG")
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
          color: const Color(0xffCAE1FF),
          borderRadius: BorderRadius.circular(9)),
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
