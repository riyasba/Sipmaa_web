import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/models/city_list_model.dart';
import 'package:reg_login/app/data/models/department_model.dart';
import 'package:reg_login/app/data/models/industries_model.dart';
import 'package:reg_login/app/data/models/profile_update_model.dart';
import 'package:reg_login/app/data/models/requiremets_models.dart';
import 'package:reg_login/app/data/models/state_list_model.dart';
import 'package:reg_login/app/data/models/widgets/email_text_field.dart';
import 'package:reg_login/app/data/models/widgets/postal_code_text.dart';
import 'package:reg_login/app/responsive/widgets/textfield.dart';

class MobStudentResgisterDetails extends StatefulWidget {
  const MobStudentResgisterDetails({super.key});

  @override
  State<MobStudentResgisterDetails> createState() => _MobStudentResgisterDetailsState();
}

class _MobStudentResgisterDetailsState extends State<MobStudentResgisterDetails> {
 final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  var designation;
  var industries;

  var selectedCity;
  var selectedState;
  var stateSelected;
  var citySelected;

  var requiremtsSelected;

  // List<String> designationList = ["Finance"];

  var currentCompanyController = TextEditingController();
  var officialController = TextEditingController();
  var locationController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var designationController = TextEditingController();
  var othersController = TextEditingController();
  var othersDepartmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authController.getDepartmentList();
    authController.getIndustriesList();
    authController.getStateList();
    authController.getRequiremetList();

  }

    List<String> employementType = [
    "Full time",
    "Part time",
    "Self employed",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Center(
        child: SingleChildScrollView(primary: true,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
                  key: _formKey,
                  child:   Column(
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
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/sipmaa.jpg',
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ksizedbox10,
                        Text(
                          'Enter the below Details',
                          style: ktextstyle22,
                        ),
            
                         ksizedbox10,
                        const Padding(
                      padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                      child: Row(
                        children: [
                           Text('Current Company'),
                        ],
                      ),
                    ), 
                    Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: currentCompanyController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.grey[250],
                labelText: 'Current Company (Optional)',
                hintStyle: TextStyle(fontSize: 12,
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(0, 158, 158, 158), width: 2.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(0, 158, 158, 158), width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(0, 158, 158, 158), width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                contentPadding:
                    const EdgeInsets.fromLTRB(17.0, 2.0, 17.0, 16.0),
              ),
            ),
          ),    
            
                      GetBuilder<AuthController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                     Text(
                                      "Industries",
                                    ),
                                    // Text(
                                    //   "*",
                                    //   style:
                                    //       primaryfont.copyWith(color: Colors.red),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0, right: 0),
                                child: Container(
                                  height: 56,
                                  child: DropdownSearch<Industry>(
                                    itemAsString: (Industry u) => u.name,
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: false,
                                      showSearchBox: true,
                                      menuProps: MenuProps(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      searchFieldProps: const TextFieldProps(),
                                    ),
                                    items: authController.industriesList,
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          // labelText: "Department *",
                                          hintText: "Industries",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        authController
                                            .isInduaturesSelected(false);
                                        industries = value!;
                                      });
                                    },
                                    // selectedItem: selectedState,
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // Obx(
                              //   () => authController.isInduaturesSelected.isTrue
                              //       ? const Padding(
                              //           padding: EdgeInsets.only(left: 15),
                              //           child: Text(
                              //             "Please select Industries",
                              //             style: TextStyle(
                              //                 color: Color.fromARGB(
                              //                     255, 230, 46, 33),
                              //                 fontSize: 12),
                              //           ),
                              //         )
                              //       : Container(),
                              // )
                            ],
                          ),
                        );
                      }),
            
                      GetBuilder<AuthController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Department",
                                    ),
                                    // Text(
                                    //   "*",
                                    //   style:
                                    //       primaryfont.copyWith(color: Colors.red),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0, right: 0),
                                child: Container(
                                  height: 56,
                                  child: authController.departments.isEmpty
                                      ? Container(
                                          height: 10,
                                        )
                                      : DropdownSearch<Department>(
                                          itemAsString: (Department u) => u.title,
                                          popupProps: PopupProps.menu(
                                            showSelectedItems: false,
                                            showSearchBox: true,
                                            menuProps: MenuProps(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            searchFieldProps:
                                                const TextFieldProps(),
                                          ),
                                          items: authController.departments,
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                                    // labelText: "Department *",
                                                    hintText: "Department",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15))),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              authController
                                                  .isDesignationSelected(false);
                                              designation = value!;
                                              requiremtsSelected = null;
                                            });
                                          },
                                          // selectedItem: selectedState,
                                        ),
                                ),
                              ),
            
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // Obx(
                              //   () => authController.isDesignationSelected.isTrue
                              //       ? const Padding(
                              //           padding: EdgeInsets.only(left: 15),
                              //           child: Text(
                              //             "Please select Department",
                              //             style: TextStyle(
                              //                 color: Color.fromARGB(
                              //                     255, 230, 46, 33),
                              //                 fontSize: 12),
                              //           ),
                              //         )
                              //       : Container(),
                              // )
                            ],
                          ),
                        );
                      }),
                      if (designation != null && designation.title == "Others")
                        TextformfieldWidget(
                            controller: othersDepartmentController,
                            text: 'Enter Department',
                            textt: 'Others'),
                      if (designation != null &&
                          designation.title == "HR Department")
                        const SizedBox(
                          height: 15,
                        ),
                      if (designation != null &&
                          designation.title == "HR Department")
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 15, bottom: 8, top: 3),
                              child: Row(
                                children: [
                                  Text(
                                    "Category",
                                  ),
                                  // Text(
                                  //   "*",
                                  //   style:
                                  //       primaryfont.copyWith(color: Colors.red),
                                  // ),
                                ],
                              ),
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 56,
                                  child: authController.requirementList.isEmpty
                                      ? Container()
                                      : DropdownSearch<Requirement>(
                                          itemAsString: (Requirement u) => u.name,
                                          popupProps: PopupProps.menu(
                                            showSelectedItems: false,
                                            showSearchBox: true,
                                            menuProps: MenuProps(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            searchFieldProps:
                                                const TextFieldProps(),
                                          ),
                                          items: authController.requirementList,
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                                    // labelText: "Recruitment",
                                                    hintText: "Category",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15))),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              requiremtsSelected = value!;
                                            });
                                          },
                                          // selectedItem: selectedState,
                                        ),
                                ),
                              );
                            }),
                          ],
                        ),
                      if (requiremtsSelected != null &&
                          requiremtsSelected.name == "Others")
                        TextformfieldWidget(
                            controller: othersController,
                            text: 'Enter Others',
                            textt: 'Others'),
                      TextformfieldWidget(
                          controller: designationController,
                          text: 'Enter Designation',
                          textt: 'Designation'),
                      TextformEmailfieldWidget(
                          controller: officialController,
                          text: 'Enter Official Email ID',
                          textt: 'Official Email ID'),
                      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 8, top: 3),
                            child: Row(
                              children: [
                                const Text(
                                  "State",
                                ),
                                Text(
                                  "*",
                                  style: primaryfont.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: authController.stateList.isEmpty
                                  ? Container()
                                  : DropdownSearch<StateList>(
                                      itemAsString: (StateList u) => u.state,
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: false,
                                        showSearchBox: true,
                                        menuProps: MenuProps(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        searchFieldProps: const TextFieldProps(),
                                      ),
                                      items: authController.stateList,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            // labelText: "State",
                                            hintText: "state",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                      ),
                                      onChanged: (value) {
                                        selectedCity = null;
                                        citySelected = null;
                                        authController.getCityList(value!.id);
                                        setState(() {
                                          selectedState = value;
                                          stateSelected = value.id;
                                          stateController.text = value.state;
                                        });
                                      },
                                      // selectedItem: selectedState,
                                    ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 8, top: 3),
                            child: Row(
                              children: [
                                const Text(
                                  "City",
                                ),
                                Text(
                                  "*",
                                  style: primaryfont.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownSearch<CityList>(
                                itemAsString: (CityList u) => u.city,
                                popupProps: PopupProps.menu(
                                  showSelectedItems: false,
                                  showSearchBox: true,
                                  menuProps: MenuProps(
                                      borderRadius: BorderRadius.circular(10)),
                                  searchFieldProps: const TextFieldProps(),
                                ),
                                items: authController.cityList,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      // labelText: "City",
                                      hintText: "City",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value!;
                                    citySelected = value.id;
                                    cityController.text = value.city;
                                  });
                                },
                                selectedItem: selectedCity,
                              ),
                            );
                          }),
                        ],
                      ),
                      TextPostalCodeformfieldWidget(
                          controller: postalCodeController,
                          isMandatory: true,
                          text: 'Postal Code',
                          textt: 'Postal Code'),
                      ksizedbox10,
                        ksizedbox10,
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:const Color(
                                    0xFF3C73B1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                    
                                    ProfileUpdateModel profileUpdateModel =
                                              ProfileUpdateModel(
                                                  currentCompany:
                                                      currentCompanyController
                                                          .text,
                                                  city: cityController.text,
                                                  designation:
                                                      designation.id.toString(),
                                                  address:
                                                      locationController.text,
                                                  department:
                                                      designationController.text,
                                                  officialEmail:
                                                      officialController.text,
                                                  pincode:
                                                      postalCodeController.text,
                                                  state: stateController.text,
                                                  others: othersController.text,
                                                  requirement:
                                                      requiremtsSelected == null
                                                          ? null
                                                          : requiremtsSelected.id,
                                                  othersdepartment:
                                                      othersDepartmentController
                                                          .text,
                                                  industries:
                                                      industries.id.toString());
                                                       print("-------------->>______________>>_____________this 2");
                                                  authController.studentUpdateProfile(profileUpdateModel);
                                     
                                    },
                                //=>Get.toNamed('/resgister-splash'),
            
                                child:const Text(
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
      ),
    );
  }
}
