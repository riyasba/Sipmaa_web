import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/modules/screens/Settings/views/widgets/widgets.dart';

import '../../../../../data/components/constands/constands.dart';
//import '../../../../../data/components/constands.dart';
import '../../../../../data/components/costom_button.dart';

class Profilewidget extends StatefulWidget {
  const Profilewidget({super.key});

  @override
  State<Profilewidget> createState() => _ProfilewidgetState();
}

class _ProfilewidgetState extends State<Profilewidget> {
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
    return Column(
      children: [
        GetBuilder<ProfileController>(builder: (_) {
          
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
                profileController.profileData.first.user.profilePicture == null
                    ? const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/createprofile.png'),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(profileController
                            .profileData.first.user.profilePicture),
                      ),
          );
        }),
        //  Image.asset('assets/images/profile.png'),
        // const SizedBox(
        //       height: 10,
        //     ),
        //     InkWell(
        //       onTap: () async {
        //         final ImagePicker _picker = ImagePicker();
        //         // Pick an image
        //         final XFile? timage =
        //             await _picker.pickImage(source: ImageSource.gallery);

        //         profileController.updateProfilePic(media: File(timage!.path));
        //       },
        //       child: Text(
        //         'Edit Profile Image',
        //         style: TextStyle(fontSize: 17, color: kblue),
        //       ),
        //     ),
        ksizedbox10,
        Container(
            width: 700,
            child: Column(
              children: [
                Textformfield(
                  controller: nameController,
                  text: 'Name',
                ),
                ksizedbox10,
                Textformfield(
                  controller: bioController,
                  text: 'Bio',
                ),
                ksizedbox10,
                Textformfield(
                  controller: positionController,
                  text: 'Position',
                ),
                ksizedbox10,
                Textformfield(
                  controller: emailController,
                  text: 'Email Addreass',
                ),
                ksizedbox10,
                Textformfield(
                  controller: numberController,
                  text: 'Phone Number',
                ),
                ksizedbox10,
                Textformfield(
                  controller: interestController,
                  text: 'Interest',
                ),
                ksizedbox10,
                Textformfield(
                  controller: genderController,
                  text: 'Gender',
                ),
                ksizedbox10,
                Textformfield(
                  controller: birthdayController,
                  text: 'Birthday',
                ),
                ksizedbox40,
                CUSTOMBUTTON(
                  onTap: () {
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
                  text: 'Next',
                ),
                ksizedbox40
              ],
            ))
      ],
    );
  }
}
