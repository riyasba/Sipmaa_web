import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';

import '../../../data/components/constands/constands.dart';
import '../../../data/models/add_positions_model.dart';
import '../../../data/models/city_list_model.dart';
import '../../../data/models/department_model.dart';
import '../../../data/models/industries_model.dart';
import '../../../data/models/requiremets_models.dart';

class ProfileAddNewPossitonView extends StatefulWidget {
  const ProfileAddNewPossitonView({super.key});

  @override
  State<ProfileAddNewPossitonView> createState() =>
      _ProfileAddNewPossitonViewState();
}

class _ProfileAddNewPossitonViewState extends State<ProfileAddNewPossitonView> {
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();

  var industries;
  var employement;

  var selectedCity;
  var designation;
  var department;

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var titleController = TextEditingController();
  var locationController = TextEditingController();
  var companyNameController = TextEditingController();
  var descriptionController = TextEditingController();
  var othersController = TextEditingController();
  var designationControllers = TextEditingController();
  var requiremtsSelected;

  @override
  void initState() {
    super.initState();
    authController.getIndustriesList();
    authController.getCityList(1141);
    authController.getDepartmentList();
    authController.getRequiremetList();
  }

  List<String> employementType = [
    "Full time",
    "Part time",
    "Self employed",
  ];

  DateTime date = DateTime.now();
  DateTime date2 = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1900),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        startDateController.text = formatDate(date, [dd, "-", mm, "-", yyyy]);
      });
  }

  _selectDate2(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date2,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1900),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date2 = picked;
        endDateController.text = formatDate(date2, [dd, "-", mm, "-", yyyy]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: kblue,
            )),
        elevation: 0,
        title: Text(
          'Add New Positions',
          style: TextStyle(color: kblue),
        ),
        backgroundColor: kwhite,
      ),
      body: ListView(
          primary: true,
          scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 5,
          ),

          //dropdown
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Company Name',
                  labelText: "Company Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: companyNameController,
            ),
          ),

          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: Container(
                      height: 56,
                      child: DropdownSearch<Department>(
                        itemAsString: (Department u) => u.title,
                        popupProps: PopupProps.menu(
                          showSelectedItems: false,
                          showSearchBox: true,
                          menuProps: MenuProps(
                              borderRadius: BorderRadius.circular(10)),
                          searchFieldProps: const TextFieldProps(),
                        ),
                        items: authController.departments,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              // labelText: "Department *",
                              hintText: "Department",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        onChanged: (value) {
                          setState(() {
                            authController.isDesignationSelected(false);
                            department = value!;
                          });
                        },
                        // selectedItem: selectedState,
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
                                  color: Color.fromARGB(255, 230, 46, 33),
                                  fontSize: 12),
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            );
          }),

          if (department != null && department.title == "HR Department")
            const SizedBox(
              height: 10,
            ),
          if (department != null && department.title == "HR Department")
            Column(
              children: [
                GetBuilder<AuthController>(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 56,
                      child: DropdownSearch<Requirement>(
                        itemAsString: (Requirement u) => u.name,
                        popupProps: PopupProps.menu(
                          showSelectedItems: false,
                          showSearchBox: true,
                          menuProps: MenuProps(
                              borderRadius: BorderRadius.circular(10)),
                          searchFieldProps: const TextFieldProps(),
                        ),
                        items: authController.requirementList,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              // labelText: "Recruitment",
                              hintText: "Category",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
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
          if (requiremtsSelected != null && requiremtsSelected.name == "Others")
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Others',
                    labelText: "Others",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black))),
                controller: locationController,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Designation',
                  labelText: "Designation",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: designationControllers,
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Container(
              height: 56,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: false,
                  showSearchBox: true,
                  menuProps: MenuProps(borderRadius: BorderRadius.circular(10)),
                  searchFieldProps: const TextFieldProps(),
                ),
                items: employementType,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      // labelText: "Department *",
                      hintText: "Employment Type",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                onChanged: (value) {
                  setState(() {
                    employement = value!;
                  });
                },
                // selectedItem: selectedState,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              GetBuilder<AuthController>(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownSearch<CityList>(
                    itemAsString: (CityList u) => u.city,
                    popupProps: PopupProps.menu(
                      showSelectedItems: false,
                      showSearchBox: true,
                      menuProps:
                          MenuProps(borderRadius: BorderRadius.circular(10)),
                      searchFieldProps: const TextFieldProps(),
                    ),
                    items: authController.cityList,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          // labelText: "City",
                          hintText: "Location",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        locationController.text = value.city;
                        // citySelected = value.id;
                        // cityController.text = value.city;
                      });
                    },
                    // selectedItem: selectedCity,
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'Start Date',
                  labelText: "Start Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: startDateController,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onTap: () {
                _selectDate2(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'End Date',
                  labelText: "End Date (optional)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: endDateController,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15.0),
          child: profileController.isLoading.isTrue
              ? Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: kblue, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : InkWell(
                  onTap: () {
                    if (department == null) {
                      Get.rawSnackbar(
                          message: "Enter Department",
                          backgroundColor: Colors.red);
                    } else if (companyNameController.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter company name",
                          backgroundColor: Colors.red);
                    } else if (locationController.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter location",
                          backgroundColor: Colors.red);
                    } else if (startDateController.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter start date",
                          backgroundColor: Colors.red);
                    } else if (employement == null) {
                      Get.rawSnackbar(
                          message: "Select employement type",
                          backgroundColor: Colors.red);
                    } else if (designationControllers.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter Designation",
                          backgroundColor: Colors.red);
                    } else {
                      AddPositonsModel addPositonsModel = AddPositonsModel(
                          department: department.id.toString(),
                          designation: designationControllers.text,
                          requireMents: requiremtsSelected.id.toString(),
                          others: othersController.text,
                          company_name: companyNameController.text,
                          employment_type: employement,
                          end_date: endDateController.text.isEmpty
                              ? "null"
                              : endDateController.text,
                          industry_name: "0",
                          location: locationController.text,
                          start_date: startDateController.text,
                          description: '',
                          title: '');

                      profileController.addPositions(
                          addPostionsModel: addPositonsModel,
                          useId: profileController.profileData.first.user.id
                              .toString());
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      "Save",
                      style: primaryfont.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
