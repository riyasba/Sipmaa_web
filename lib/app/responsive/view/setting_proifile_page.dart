import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/profile_controller.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  bool _value = false;
  var nameController = TextEditingController();
  var bioController = TextEditingController();
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
      bioController.text = profileController.profileData.first.user.bio ?? "";
      positionController.text =
          profileController.profileData.first.user.designation ?? "";
      numberController.text = profileController.profileData.first.user.mobile;
      emailController.text =
          profileController.profileData.first.user.officialEmail ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: kblue,
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
                return Container(
                  height: 25,
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
                                    bioController.text.isNotEmpty &&
                                    positionController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty &&
                                    numberController.text.isNotEmpty) {
                                  profileController.updateUserDetails(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      designation: positionController.text,
                                      email: emailController.text,
                                      mobile: numberController.text);
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
                );
              }),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
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
                                        profileController.profileData.first.user
                                            .profilePicture),
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

                //    profileController.updateProfilePic(media: File(timage!.path));
              },
              child: Text(
                'Edit Profile Image',
                style: TextStyle(fontSize: 17, color: kblue),
              ),
            ),
            SizedBox(
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
                            hintText: 'Name',
                          ),
                          controller: nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'BIO',
                          ),
                          controller: bioController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Position',
                          ),
                          controller: positionController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email Adress',
                          ),
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                          controller: numberController,
                        ),
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
        ),
      ),
    );
  }
}
