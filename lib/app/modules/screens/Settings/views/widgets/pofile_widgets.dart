import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/profile.png'),
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
                  onTap: () {},
                  text: 'Next',
                ),
                ksizedbox40
              ],
            ))
      ],
    );
  }
}
