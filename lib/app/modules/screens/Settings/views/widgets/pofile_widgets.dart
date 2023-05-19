import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reg_login/app/modules/screens/Settings/views/widgets/widgets.dart';

import '../../../../../data/components/constands/constands.dart';
//import '../../../../../data/components/constands.dart';
import '../../../../../data/components/costom_button.dart';

class Profilewidget extends StatelessWidget {
  const Profilewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/profile.png'),
        ksizedbox10,
        Container(
            width: 750,
            child: Column(
              children: [
                Textformfield(
                  text: 'Name',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Bio',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Position',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Email Addreass',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Phone Number',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Interest',
                ),
                ksizedbox10,
                Textformfield(
                  text: 'Gender',
                ),
                ksizedbox10,
                Textformfield(
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
