import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';
import 'package:reg_login/app/responsive/view/public_profle_view/add_new_skills_page.dart';
import 'package:reg_login/app/responsive/view/public_profle_view/profile_add_new_possition_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/controllers/profile_controller.dart';
import '../../../../respohome/resposetings/wigitskills.dart';

class SettingProfilePageweb extends StatefulWidget {
  const SettingProfilePageweb({super.key});

  @override
  State<SettingProfilePageweb> createState() => _SettingProfilePagewebState();
}

class _SettingProfilePagewebState extends State<SettingProfilePageweb> {
  bool _value = false;
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
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

      lastNameController.text =
          profileController.profileData.first.user.lastName ?? "";

      bioController.text = profileController.profileData.first.user.bio ?? "";
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
    Get.offAll(() => SettingProfilePageweb());
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
    //  height: 1100,
      width: 700,
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
                                    backgroundImage:
                                        AssetImage('assets/images/propic.jpg'),
                                  )
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

                final croppedImage = await ImageCropper().cropImage(
                  sourcePath: timage!.path,
                  cropStyle: CropStyle.circle,
                  aspectRatioPresets: [CropAspectRatioPreset.ratio5x4],
                  uiSettings: [
                    AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: kblue,
                        toolbarWidgetColor: Colors.white,
                        initAspectRatio: CropAspectRatioPreset.original,
                        lockAspectRatio: false),
                    IOSUiSettings(
                      title: 'Cropper',
                    ),
                    WebUiSettings(
                      context: context,
                      presentStyle: CropperPresentStyle.dialog,
                      boundary: const CroppieBoundary(
                        width: 400,
                        height: 300,
                      ),
                      viewPort: const CroppieViewPort(
                          width: 200, height: 200, type: 'circle'),
                      enableExif: true,
                      enableZoom: true,
                      showZoomer: true,
                    ),
                  ],
                );

                var imageUnitData = await croppedImage!.readAsBytes();
                var tse = imageUnitData.toList();

                profileController.updateProfilePic(media: tse);
              },
              child: Text(
                'Edit Profile Image',
                style: TextStyle(fontSize: 17, color: kblue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //  height: MediaQuery.of(context).size.height * 0.7,
              child: Column(children: [
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
                                borderSide:
                                    const BorderSide(color: Colors.black))),
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
                                borderSide:
                                    const BorderSide(color: Colors.black))),
                        controller: lastNameController,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'About',
                            labelText: 'About',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black))),
                        controller: bioController,
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
                                borderSide:
                                    const BorderSide(color: Colors.black))),
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
                                borderSide:
                                    const BorderSide(color: Colors.black))),
                        controller: numberController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
              ksizedbox30,

              //   const SizedBox(
              //   height: 10,
              // ),
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
                          padding: const EdgeInsets.only(left: 10),
                          child: TextButton(
                              onPressed: () {
                                Get.to(RespNewPosition());
                              },
                              child: Text(
                                "+ Add new position",
                                style: primaryfont.copyWith(color: Colors.blue),
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
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount:
                              profileController.profileData.first.skills.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 4, crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 3, left: 3, bottom: 5),
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: kblue,
                                    borderRadius: BorderRadius.circular(50)),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    profileController
                                        .profileData.first.skills[index].name,
                                    style: primaryfont.copyWith(
                                      color: Colors.white,
                                    ),
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
                                Get.to(RespAddSkills());
                              },
                              child: Text(
                                "+ Add new Skills",
                                style: primaryfont.copyWith(color: Colors.blue),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: kblue),
              child: profileController.isLoading.isTrue
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Submit').text.semiBold.white.make(),
                              kwidth10,
                              const CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: InkWell(
                        onTap: () {
                          if (nameController.text.isNotEmpty &&
                              lastNameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              numberController.text.isNotEmpty) {
                            print(nameController.text);
                            print(selectedCategory);
                            profileController.updateUserDetails(
                                name: nameController.text,
                                bio: bioController.text,
                                lastName: lastNameController.text,
                                designation: positionController.text,
                                hisOrHer: selectedCategory ?? "",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Submit').text.semiBold.white.make(),
                            kwidth10,
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )),
            ),
            ksizedbox20,
            ksizedbox40,
          ],
        );
      }),
    );
  }
}
