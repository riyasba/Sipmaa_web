import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/responsive/view/public_profle_view/add_new_skills_page.dart';
import 'package:reg_login/app/responsive/view/public_profle_view/profile_add_new_possition_view.dart';
import '../../../data/components/constands/constands.dart';
import '../../../data/components/controllers/profile_controller.dart';


class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  bool _value = false;
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var positionController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var interestController = TextEditingController();
  var genderController = TextEditingController();
  var birthdayController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefaullt();
  }

  setDefaullt() async {
    if (profileController.profileData.isNotEmpty) {
      nameController.text = profileController.profileData.first.user.name;

      lastNameController.text =
          profileController.profileData.first.user.lastName ?? "";
      // selectedCategory =
      //     profileController.profileData.first.user. ?? "";
      positionController.text =
          profileController.profileData.first.user.designation ?? "";
      numberController.text = profileController.profileData.first.user.mobile;
      emailController.text =
          profileController.profileData.first.user.officialEmail ?? "";
      setState(() {
        selectedCategory = profileController.profileData.first.user.hisHer;
      });
    }
  }

  var selectedCategory;

  bool isNewPossitionEnabled = false;

  Widget _buildDropDownButton() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            iconEnabledColor: Colors.grey,
            style: const TextStyle(
              color: Colors.grey,
            ),
            dropdownColor: Colors.white,
            value: selectedCategory,
            hint: const Text("Select"),
            items: ['His', 'Her']
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          Text(
                            value,
                            style: primaryfont.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
        ),
      ),
    );
  }

  getBack() {
    Get.offAll(() =>SettingProfilePage() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile'),
        backgroundColor: kblue,
        leading: InkWell(
            onTap: () {Get.back();
             // getBack();
            },
            child: const Icon(Icons.arrow_back)),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GetBuilder<ProfileController>(builder: (_) {
                return Row(
                  children: [
                    Container(
                      height: 40,
                      width: 42,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: kblue),
                      child: profileController.isLoading.isTrue
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: IconButton(
                                  onPressed: () {
                                    if (nameController.text.isNotEmpty &&
                                        lastNameController.text.isNotEmpty &&
                                        positionController.text.isNotEmpty &&
                                        emailController.text.isNotEmpty &&
                                        numberController.text.isNotEmpty) {
                                      // profileController.updateUserDetails(
                                      //     name: nameController.text,
                                      //     bio: lastNameController.text,
                                      //     designation: positionController.text,
                                      //     hisOrHer: selectedCategory,
                                      //     email: emailController.text,
                                      //     mobile: numberController.text);
                                    } else {
                                      Get.rawSnackbar(
                                        messageText: const Text(
                                          "Fill All the fields",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ))),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          return getBack();
        },
        child: Container(
          child: GetBuilder<ProfileController>(builder: (_) {
            return Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                GetBuilder<ProfileController>(builder: (_) {
                  return profileController.isLoading.isTrue
                      ? Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: const CircularProgressIndicator(),
                        )
                      : profileController.profileData.isEmpty
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                profileController.profileData.first.user
                                            .profilePicture ==
                                        null
                                    ? const CircleAvatar(
                                        radius: 60,
                                        backgroundImage: AssetImage(
                                            'assets/icons/profile_icon.png'))
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                            profileController.profileData.first
                                                .user.profilePicture),
                                      ),
                              ],
                            );
                }),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    final XFile? timage =
                        await _picker.pickImage(source: ImageSource.gallery);

    var imageUnitData =  await timage!.readAsBytes();
    var tse = imageUnitData.toList();


    
                    profileController.updateProfilePic(
                        media:tse);


                  },




                  child: Text(
                    'Edit Profile Image',
                    style: TextStyle(fontSize: 17, color: kblue),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView(shrinkWrap: true, children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'First Name',
                                  labelText: 'First Name',
                                  prefixIcon: _buildDropDownButton(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black))),
                              controller: nameController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  labelText: 'Last Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black))),
                              controller: lastNameController,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Email Adress',
                                  labelText: 'Email Adress',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black))),
                              controller: emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black))),
                              controller: numberController,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Current Position",
                                  style: primaryfont.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          for (int i = 0;
                              i <
                                  profileController
                                      .profileData.first.positions.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileController
                                          .profileData.first.positions[i].title,
                                      style: primaryfont.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          profileController.profileData.first
                                              .positions[i].companyName,
                                          style: primaryfont.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(" . "),
                                        Text(
                                          profileController.profileData.first
                                              .positions[i].employmentType,
                                          style: primaryfont.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          profileController.profileData.first
                                              .positions[i].startDate,
                                          style: primaryfont.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(" - "),
                                        Text(
                                          profileController.profileData.first
                                                  .positions[i].endDate ??
                                              "on going",
                                          style: primaryfont.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      profileController.profileData.first
                                          .positions[i].location,
                                      style: primaryfont.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(ProfileAddNewPossitonView());
                                    },
                                    child: Text(
                                      "+ Add new position",
                                      style: primaryfont.copyWith(
                                          color: Colors.blue),
                                    )),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Skills",
                                  style: primaryfont.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: profileController
                                    .profileData.first.skills.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3, crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 3, left: 3, bottom: 5),
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: kblue.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          profileController.profileData.first
                                              .skills[index].name,
                                          style: primaryfont.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(AddNewSkillsView());
                                    },
                                    child: Text(
                                      "+ Add new Skills",
                                      style: primaryfont.copyWith(
                                          color: Colors.blue),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //       hintText: 'Gender',
                          //     ),
                          //     controller: genderController,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //       hintText: 'Birthday',
                          //     ),
                          //     controller: birthdayController,
                          //   ),
                          // )
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
