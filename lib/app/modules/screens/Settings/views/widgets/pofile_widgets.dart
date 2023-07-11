import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  var positionController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var interestController = TextEditingController();
  var genderController = TextEditingController();
  var birthdayController = TextEditingController();
  var hisherController = TextEditingController();
  var addcurentController = TextEditingController();
  var titleController = TextEditingController();
  var employmentController = TextEditingController();
  var companynameController = TextEditingController();
  var locationController = TextEditingController();
  var startdateController = TextEditingController();
  var todateController = TextEditingController();
  var intusryController = TextEditingController();
  var descriptionController = TextEditingController();
  var skillsController = TextEditingController();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefaullt();
  }

  setDefaullt() async {
    if (profileController.profileData.isNotEmpty) {
      nameController.text = profileController.profileData.first.user.name;
      hisherController.text = profileController.profileData.first.user.bio ?? "";
      positionController.text =
          profileController.profileData.first.user.designation ?? "";
      numberController.text = profileController.profileData.first.user.mobile;
      emailController.text =
          profileController.profileData.first.user.officialEmail ?? "";
    }
  }
   DateTime selectedDate = DateTime.now();
     DateTime toselectedDate = DateTime.now();
   var dateSelected;
    var todateselected;
  
var selectedCategory;
Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateSelected=picked;
      });
    }
  }

  Future<void>_toselectedDate(BuildContext context)async{
    final DateTime? todatepicked=await showDatePicker(context: context,
     initialDate: toselectedDate, 
     firstDate:DateTime(2015,8), 
     lastDate:DateTime(2101) );
     if(todatepicked!=null&&todatepicked!=toselectedDate){
      setState(() {
        toselectedDate=todatepicked;
        todateselected=todatepicked;
      });
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
                      radius: 60,
                      foregroundColor: Colors.grey,
                        backgroundImage:
                            AssetImage('assets/images/profile_icon.png'),
                      )
                    : CircleAvatar(
                      radius: 60,
                      foregroundColor: Colors.grey,
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
        ksizedbox30,
        Container(
            width: MediaQuery.of(context).size.width*0.45,
            child: Column(
              children: [
                Textformfield(
                  controller: nameController,
                  text: 'First Name',
                ),
                ksizedbox30,
                Textformfield(
                  controller: hisherController,
                  text: 'Last Name',
                ),
                ksizedbox30,
                Textformfield(
                  controller: positionController,
                  text: 'His/Her',
                ),
              
                ksizedbox30,
                Textformfield(
                  controller: emailController,
                  text: 'Email Addreass',
                ),
                ksizedbox30,
                Textformfield(
                  controller: numberController,
                  text: 'Phone Number',
                ),
                ksizedbox30,
                Textformfield(
                  controller: interestController,
                  text: 'Interest',
                ),
                ksizedbox30,
                Textformfield(
                  controller: genderController,
                  text: 'Gender',
                ),
                ksizedbox30,
                Textformfield(
                  controller: birthdayController,
                  text: 'Birthday',
                ),
                   ksizedbox30,
                Textformfield(
                  controller: positionController,
                  text: 'Current Position',
                ),
                 ksizedbox30,
                Textformfield(
                  controller: addcurentController,
                  text: '+ Add new position ',
                ),
                ksizedbox30,
                 Textformfield(
                  controller: titleController,
                  text: 'Title',
                ),
                ksizedbox30,
                Textformfield(
                  controller: employmentController,
                  text: 'Employment Type',
                ),
                ksizedbox30,
                 Textformfield(
                  controller: companynameController,
                  text: 'Company Name',
                ),
                ksizedbox30,
                 Textformfield(
                  controller: locationController,
                  text: 'Location',
                ),
                ksizedbox30,
                Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width*45,
                  decoration: BoxDecoration(
                    color: kwhite.withOpacity(0.2),
                    border: Border.all(
                      color: kgrey
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                           children: [
                             Text(dateSelected == null ? "Start Date" : 
                             formatDate(dateSelected, [dd,"-",mm,"-",yyyy]),
                             style: TextStyle(
                              fontSize: 15,
                              color: kgrey
                             ),),
                              IconButton(onPressed: (){
                            setState(() {
                                  _selectDate(context);
                            });
                          }, 
                          icon:  const Icon(Icons.date_range)),
                           ],
                         ) ,
                         
                          Row(
                            children: [
                              Text(todateselected==null?"End Date":
                              formatDate(todateselected, [dd,'-',mm,'-',yyyy])),
                              IconButton(onPressed: (){
                                setState(() {
                                  _toselectedDate(context);
                                });
                              }, 
                              icon: Icon(Icons.date_range)),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                ksizedbox30,
                  Textformfield(
                  controller: intusryController,
                  text: 'Industry',
                ),
                ksizedbox30,
                Textformfield(
                  controller: descriptionController,
                  text: 'Description',
                ),ksizedbox30,
                 Textformfield(
                  controller: skillsController,
                  text: 'Skills',
                ),
                ksizedbox40,
                CUSTOMBUTTON(
                  onTap: () {
                    if (nameController.text.isNotEmpty &&
                        hisherController.text.isNotEmpty &&
                        positionController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        numberController.text.isNotEmpty) {
                      profileController.updateUserDetails(
                        hisOrHer: selectedCategory,
                          name: nameController.text,
                          bio: hisherController.text,
                          designation: positionController.text,
                          email: emailController.text,
                          mobile: numberController.text, );
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
                  text: 'Save',
                  
                ),
                ksizedbox40
              ],
            ))
      ],
    );
  }
}
