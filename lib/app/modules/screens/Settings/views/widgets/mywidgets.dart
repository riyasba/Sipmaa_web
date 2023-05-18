import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reg_login/app/modules/screens/Settings/views/widgets/widgets.dart';

import '../../../../../../constands.dart';
import '../../../../../data/components/costom_button.dart';
//import '../../../../../data/components/constands.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 750,
        child: Column(
          children: [
            Textformfield(
              text: 'Old Password',
            ),
            ksizedbox10,
            Textformfield(text: 'New Password'),
            ksizedbox10,
            Textformfield(text: 'Conform Password'),
            ksizedbox30,
            CUSTOMBUTTON(
              text: 'Save',
              onTap: () {},
            ),ksizedbox40
          ],
        ));
  }
}

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Since the launch of Flutter in May 2017Since the launch of Flutter in May 2017, it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform.Since the launch of Flutter in May 2017, it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform. it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform."),
    )],);
  }
}

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Since the launch of Flutter in May 2017Since the launch of Flutter in May 2017, it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform.Since the launch of Flutter in May 2017, it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform. it has resolved many of the existing problems in the app development industry. Flutter is a powerful language packed with a powerful mobile framework that can be used in both iOS and Android applications. Flutter is often used with DART, which is an object-oriented programming language by Google. The flutter development tools come with graphics library and material design allowing faster operations of the app and also giving the app a stunning look, irrespective of its operating platform! The biggest advantage of flutter is that it can be used to create cross-platform apps. Using flutter one can create iOS and Android apps in just one go, there is no need to develop app individually for both the platform."),
    )],);
  }
}
