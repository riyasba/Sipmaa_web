import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/models/department_model.dart';
import 'package:reg_login/app/data/models/industries_model.dart';
import 'package:reg_login/app/data/models/profile_update_model.dart';

import '../../../../data/components/constands/constands.dart';
import '../../../../data/components/constands/formfield.dart';
import '../../../../data/models/widgets/email_text_field.dart';
import '../../../../data/models/widgets/postal_code_text.dart';
import '../../../../data/models/widgets/textfield.dart';

class ResgisterDetailsWeb extends StatefulWidget {
  const ResgisterDetailsWeb({super.key});

  @override
  State<ResgisterDetailsWeb> createState() => _ResgisterDetailsWebState();
}

class _ResgisterDetailsWebState extends State<ResgisterDetailsWeb> {
  final authController = Get.find<AuthController>();

  var designation;
  var industries;

  var currentCompanyController = TextEditingController();
  var officialController = TextEditingController();
  var locationController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var designationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authController.getDepartmentList();
    authController.getIndustriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(primary: true,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // height:1200,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 37, right: 37, top: 40, bottom: 40),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/logo (3).png',
                      ),
                      ksizedbox10,
                      Text(
                        'Enter the below Details',
                        style: ktextstyle22,
                      ),

                      ksizedbox10,

                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text('  Professional Qualification'),
                      //       ksizedbox10,
                      //       DropDownField(
                      //         items: _options,
                      //         hintText: ' Select Qualification',
                      //         onValueChanged: (value) {},
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // TextformfieldWidgett(
                      //    controller: currentCompanyController,
                      //     text: 'Current Company',
                      //     textt: 'Current Company'),
                      //     TextformfieldWidgett(
                      //   controller: designationController,
                      //   text: 'Enter Designation',
                      //   textt: 'Designation'),
                      //  GetBuilder<AuthController>(builder: (_) {
                      //   return Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         const Padding(
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "Department",
                      //           ),
                      //         ),
                      //         Container(
                      //           height: 50,
                      //           width: 430,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(10),
                      //               border: Border.all(
                      //                   color: const Color.fromARGB(
                      //                           255, 158, 158, 158)
                      //                       .withOpacity(0.2))),
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(
                      //                 left: 10, right: 10, top: 10),
                      //             child: DropdownButton<Department>(
                      //               value: designation,
                      //               isExpanded: true,
                      //               icon: const Icon(
                      //                   Icons.keyboard_arrow_down_outlined),
                      //               elevation: 0,
                      //               itemHeight: 55,
                      //               isDense: true,
                      //               dropdownColor: Colors.grey[250],
                      //               style: const TextStyle(color: Colors.black54),
                      //               hint: const Text(
                      //                 "Department",
                      //                 style: TextStyle(fontSize: 14),
                      //               ),
                      //               onChanged: (Department? value) {
                      //                 // This is called when the user selects an item.
                      //                 setState(() {
                      //                   authController
                      //                       .isDesignationSelected(false);
                      //                   designation = value!;
                      //                 });
                      //               },
                      //               items: authController.departments
                      //                   .map<DropdownMenuItem<Department>>(
                      //                       (Department value) {
                      //                 return DropdownMenuItem<Department>(
                      //                   value: value,
                      //                   child: Text(value.title),
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 5,
                      //         ),
                      //         Obx(
                      //           () => authController.isDesignationSelected.isTrue
                      //               ? const Padding(
                      //                   padding: EdgeInsets.only(left: 15),
                      //                   child: Text(
                      //                     "Please select Department",
                      //                     style: TextStyle(
                      //                         color: Color.fromARGB(
                      //                             255, 230, 46, 33),
                      //                         fontSize: 12),
                      //                   ),
                      //                 )
                      //               : Container(),
                      //         )
                      //       ],
                      //     ),
                      //   );
                      // }),
                      TextformfieldWidget(
                          controller: currentCompanyController,
                          isMandatory: true,
                          text: 'Current Company',
                          textt: 'Current Company'),
                      TextformfieldWidget(
                          controller: designationController,
                          isMandatory: true,
                          text: 'Enter Designation',
                          textt: 'Designation'),

                      GetBuilder<AuthController>(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "Industries",
                                  ),
                                  Text(
                                    "*",
                                    style:
                                        primaryfont.copyWith(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              //width: 330,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                              255, 158, 158, 158)
                                          .withOpacity(0.2))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: DropdownButton<Industry>(
                                  value: industries,
                                  isExpanded: true,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  elevation: 0,
                                  itemHeight: 55,
                                  isDense: true,
                                  dropdownColor: Colors.grey[250],
                                  style: const TextStyle(color: Colors.black54),
                                  hint: const Text(
                                    "Industries",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onChanged: (Industry? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      authController
                                          .isInduaturesSelected(false);
                                      industries = value!;
                                    });
                                  },
                                  items: authController.industriesList
                                      .map<DropdownMenuItem<Industry>>(
                                          (Industry value) {
                                    return DropdownMenuItem<Industry>(
                                      value: value,
                                      child: Text(value.name),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => authController.isInduaturesSelected.isTrue
                                  ? const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Please select Industries",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 230, 46, 33),
                                            fontSize: 12),
                                      ),
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      );
                    }),    

                      GetBuilder<AuthController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                padding:const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Department",
                                    ),
                                    Text(
                                    "*",
                                    style:
                                        primaryfont.copyWith(color: Colors.red),
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                // width: 330,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                                255, 158, 158, 158)
                                            .withOpacity(0.2))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: DropdownButton<Department>(
                                    value: designation,
                                    isExpanded: true,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 0,
                                    itemHeight: 55,
                                    isDense: true,
                                    dropdownColor: Colors.grey[250],
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    hint: const Text(
                                      "Department",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onChanged: (Department? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        authController
                                            .isDesignationSelected(false);
                                        designation = value!;
                                      });
                                    },
                                    items: authController.departments
                                        .map<DropdownMenuItem<Department>>(
                                            (Department value) {
                                      return DropdownMenuItem<Department>(
                                        value: value,
                                        child: Text(value.title),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Obx(
                                () =>
                                    authController.isDesignationSelected.isTrue
                                        ? const Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "Please select Department",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 230, 46, 33),
                                                  fontSize: 12),
                                            ),
                                          )
                                        : Container(),
                              )
                            ],
                          ),
                        );
                      }),
                      TextformEmailfieldWidget(
                          controller: officialController,
                          isMandatory: true,
                          text: 'Enter Official Email ID',
                          textt: 'Official Email ID'),
                      TextformfieldWidget(
                          controller: cityController,
                          isMandatory: true,
                          text: 'Enter City',
                          textt: 'City'),
                      TextformfieldWidget(
                          controller: stateController,
                          isMandatory: true,
                          text: 'Enter State',
                          textt: 'State'),
                      TextPostalCodeformfieldWidget(
                          controller: postalCodeController,
                          isMandatory: true,
                          text: 'Postal Code',
                          textt: 'Postal Code'),
                      // TextformfieldWidgett(
                      //   controller: officialController,
                      //   text: 'Enter Official Email ID',
                      //   textt: 'Official Email ID'),
                      // TextformfieldWidgett(
                      //   controller: locationController,
                      //   text: 'Enter Location',
                      //   textt: 'Location'),
                      // TextformfieldWidgett(
                      //   controller: cityController,
                      //   text: 'Type City',
                      //   textt: 'City'),
                      // TextformfieldWidgett(
                      //   controller: stateController,
                      //   text: 'Type State',
                      //   textt: 'State'),
                      // TextformfieldWidgett(
                      //   controller: postalCodeController,
                      //   text: 'Postal Code',
                      //   textt: 'Postal Code'),
                      ksizedbox10,
                      ksizedbox10,
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(
                                  0xFF3C73B1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                if (industries == null) {
                                      authController.isInduaturesSelected(true);
                                    }
                                if (authController.isDesignationSelected.isFalse &&
                                authController
                                              .isInduaturesSelected.isFalse) {
                                  ProfileUpdateModel profileUpdateModel =
                                      ProfileUpdateModel(
                                    currentCompany:
                                        currentCompanyController.text,
                                    city: cityController.text,
                                    designation: designation.id.toString(),
                                    address: locationController.text,
                                    department: designationController.text,
                                    officialEmail: officialController.text,
                                    pincode: postalCodeController.text,
                                    state: stateController.text,
                                    industries: industries.id.toString()
                                  );
                                  authController
                                      .updateProfile(profileUpdateModel);
                                }
                              },
                              //=>Get.toNamed('/resgister-splash'),

                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      ksizedbox10,
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
