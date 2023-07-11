import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:reg_login/app/modules/screens/Settings/controller/settings_controller.dart';

import 'package:reg_login/app/modules/screens/Settings/views/widgets/mywidgets.dart';
import 'package:reg_login/app/modules/screens/Settings/views/widgets/pofile_widgets.dart';
//import 'package:reg_login/app/modules/screens/Settings/views/widgets/profile_widget.dart';


import '../../../../data/components/constands/constands.dart';

import '../../profile/views/profileupdate_settings.dart';
import '../controllers/controllers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

TextEditingController textController = TextEditingController();

class _SettingsPageState extends State<SettingsPage> {
  int index = 0;
  final settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Obx(
          () => Container(
            child: Column(
                children: [
                ksizedbox30,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          settingsController.settingIndex(0);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Profile',
                              style: GoogleFonts.openSans(
                                //letterSpacing: 0.5,
                                  color:
                                      settingsController.settingIndex.value == 0
                                          ? kblue
                                          : kwhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.5),
                            ),
                          ),
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                              color: settingsController.settingIndex.value == 0
                                  ? kwhite
                                  : kblue,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 7,
                                  color: kblue
                                )
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          settingsController.settingIndex(1);
                        },
                        child: Container(
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'Change password',
                                style: GoogleFonts.openSans(
                                    color:
                                        settingsController.settingIndex.value ==
                                                1
                                            ? kblue
                                            : kwhite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.5),
                              ),
                            ),
                          ),
                          height: 25,
                          decoration: BoxDecoration(
                              color: settingsController.settingIndex.value == 1
                                  ? kwhite
                                  : kblue,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 7,
                                  color: kblue,

                                )
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          settingsController.settingIndex(2);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Privacy',
                              style: GoogleFonts.openSans(
                                  color:
                                      settingsController.settingIndex.value == 2
                                          ? kblue
                                          : kwhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.5),
                            ),
                          ),
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              color: settingsController.settingIndex.value == 2
                                  ? kwhite
                                  : kblue,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 7,
                                  color: kblue,
                                  
                                )
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          settingsController.settingIndex(3);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Terms & Conditions',
                              style: GoogleFonts.openSans(
                                  color:
                                      settingsController.settingIndex.value == 3
                                          ? kblue
                                          : kwhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.5),
                            ),
                          ),
                          height: 25,
                          width: 155,
                          decoration: BoxDecoration(
                              color: settingsController.settingIndex.value == 3
                                  ? kwhite
                                  : kblue,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0.0, 0.75,
                                  ),
                                  blurRadius: 7,
                                  color: kblue,

                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                  height: 40,
                  width: 700,
                  decoration: BoxDecoration(
                      color: kblue, borderRadius: BorderRadius.circular(8)),
                ),
                ksizedbox30,
                if (settingsController.settingIndex.value == 0)SettingProfilePageweb()
                 ,
                if (settingsController.settingIndex.value == 1)
                  Changepassword(),
                if (settingsController.settingIndex.value == 2) Privacy(),
                if (settingsController.settingIndex.value == 3)
                  Termsandconditions()
              ],
            ),
            //  height: 800,
            width: 750,
            // width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
