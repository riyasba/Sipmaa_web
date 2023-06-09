import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';

import '../../../data/components/constands/constands.dart';
import '../../../data/models/add_positions_model.dart';
import '../../../data/models/industries_model.dart';


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

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var titleController = TextEditingController();
  var locationController = TextEditingController();
  var companyNameController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authController.getIndustriesList();
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
        elevation: 0,
        title: const Text('Profile'),
        backgroundColor: kblue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Title',
                  labelText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: titleController,
            ),
          ),
          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 60,
                width: 330,
                // padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 12, 12, 12)
                            .withOpacity(0.4))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
                  child: DropdownButton<Industry>(
                    value: industries,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
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
                        authController.isInduaturesSelected(false);
                        industries = value!;
                      });
                    },
                    items: authController.industriesList
                        .map<DropdownMenuItem<Industry>>((Industry value) {
                      return DropdownMenuItem<Industry>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
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
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 60,
              width: 330,
              // padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 12, 12, 12)
                          .withOpacity(0.4))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
                child: DropdownButton<String>(
                  value: employement,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 0,
                  itemHeight: 55,
                  isDense: true,
                  dropdownColor: Colors.grey[250],
                  style: const TextStyle(color: Colors.black54),
                  hint: const Text(
                    "Employment Type",
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      employement = value!;
                    });
                  },
                  items: employementType
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Location',
                  labelText: "Location",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: locationController,
            ),
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
          //start date to end date

          //industrty

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Description',
                  labelText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
              controller: descriptionController,
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
                    if (titleController.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter title", backgroundColor: Colors.red);
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
                    } else if (industries == null) {
                      Get.rawSnackbar(
                          message: "Select Industries",
                          backgroundColor: Colors.red);
                    } else if (employement == null) {
                      Get.rawSnackbar(
                          message: "Select employement type",
                          backgroundColor: Colors.red);
                    } else if (descriptionController.text.isEmpty) {
                      Get.rawSnackbar(
                          message: "Enter description",
                          backgroundColor: Colors.red);
                    } else {
                      AddPositonsModel addPositonsModel = AddPositonsModel(
                          title: titleController.text,
                          company_name: companyNameController.text,
                          description: descriptionController.text.isEmpty
                              ? ""
                              : descriptionController.text,
                          employment_type: employement,
                          end_date: endDateController.text.isEmpty
                              ? "null"
                              : endDateController.text,
                          industry_name: industries.id.toString(),
                          location: locationController.text,
                          start_date: startDateController.text);

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
