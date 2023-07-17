//import 'package:dropdownfield/dropdownfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:reg_login/app/data/models/industries_model.dart';

import '../../data/components/constands/constands.dart';

import '../../data/components/controllers/auth_controllers.dart';
import '../../data/models/department_model.dart';
import '../../data/models/profile_update_model.dart';
import '../../data/models/widgets/email_text_field.dart';
import '../../data/models/widgets/postal_code_text.dart';
import '../../data/models/widgets/textfield.dart';

class RegisterDetailsMobView extends StatefulWidget {
  const RegisterDetailsMobView({super.key});

  @override
  State<RegisterDetailsMobView> createState() => _RegisterDetailsMobViewState();
}

class _RegisterDetailsMobViewState extends State<RegisterDetailsMobView> {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  var designation;
  var industries;

  // List<String> designationList = ["Finance"];

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(primary: true,
          scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 37, right: 37, top: 40, bottom: 40),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/title.jpg',
                    ),
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
                              width: 330,
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
                                    color:
                                        const Color.fromARGB(255, 158, 158, 158)
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
                                style: const TextStyle(color: Colors.black54),
                                hint: const Text(
                                  "Department",
                                  style: TextStyle(fontSize: 14),
                                ),
                                onChanged: (Department? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    authController.isDesignationSelected(false);
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
                            () => authController.isDesignationSelected.isTrue
                                ? const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Please select Department",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 230, 46, 33),
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
                  ksizedbox10,
                  ksizedbox10,
                  Obx(
                    () => SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: authController.isLoading.isTrue
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (designation == null) {
                                    authController.isDesignationSelected(true);
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    //redirect
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
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                      ),
                    ),
                  ),
                  ksizedbox10,
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
