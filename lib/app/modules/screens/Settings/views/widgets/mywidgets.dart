import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import '../../../../../data/components/constands/constands.dart';
import '../../../../../data/components/costom_button.dart';
//import '../../../../../data/components/constands.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {

   var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confrmPasswordController = TextEditingController();

  final profileController = Get.find<ProfileController>();
  var oldvisibility=true;
  var newpasswordvisibility=true;
  var confirmpasswordvisibility=true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 700,
        child: Column(
          children: [
            ksizedbox30,
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20),
             child: TextField(
              obscureText: oldvisibility,
              controller: oldPasswordController,
              decoration: InputDecoration(
              
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                  oldvisibility=!oldvisibility;
                  });
               },
                icon:oldvisibility? Icon(Icons.visibility):Icon(Icons.visibility_off)),
                hintText: 'Old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                
              ),
              
             ),
           ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                obscureText: newpasswordvisibility,
                controller: newPasswordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      newpasswordvisibility=!newpasswordvisibility;
                    });
                  }, 
                  icon: newpasswordvisibility?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                  hintText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                ),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                obscureText: confirmpasswordvisibility,
                controller: confrmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      confirmpasswordvisibility=!confirmpasswordvisibility;
                    });
                  }, 
                  icon:confirmpasswordvisibility? Icon(Icons.visibility):
                  Icon(Icons.visibility_off))
                ),
              ),
            ),
            ksizedbox30,
            CUSTOMBUTTON(
              text: 'Save',
              onTap: () {
                 if (oldPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty &&
                    confrmPasswordController.text.isNotEmpty) {
                  profileController.changePassword(
                      oldPassword: oldPasswordController.text,
                      currentPassword: newPasswordController.text,
                      condirmPassword: confrmPasswordController.text);
                } else {
                  Get.rawSnackbar(message: "Please fill all the fields");
                }
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return Dialog(
                //         child: Container(
                //           height: MediaQuery.of(context).size.height * 0.4,
                //           width: MediaQuery.of(context).size.width * 0.2,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(7),
                //             color: kwhite,
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.only(top: 10),
                //             child: Column(
                //               children: [
                //                 Row(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Image.asset(
                //                         'assets/images/Character.png',
                //                         fit: BoxFit.fitHeight,
                //                         height: 150,
                //                       ),
                //                       ksizedbox30
                //                     ]),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 20),
                //                   child: Text(
                //                     'Your Post has been \nChange Successfully',
                //                     style:
                //                         TextStyle(fontWeight: FontWeight.w900),
                //                   ),
                //                 ),
                //                 ksizedbox30,
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 40, right: 40),
                //                   child: ElevatedButton(
                //                       style: ElevatedButton.styleFrom(
                //                           backgroundColor: kblue,
                //                           minimumSize: Size(
                //                               MediaQuery.of(context)
                //                                       .size
                //                                       .width *
                //                                   0.2,
                //                               45)),
                //                       onPressed: () {},
                //                       child: Text(
                //                         'Done',
                //                         style: TextStyle(fontSize: 17),
                //                       )),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     });
              },
            ),
            ksizedbox40
          ],
        ));
  }
}

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(
  '''Privacy policy:
''',
  style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  ),
),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
             '''Our Privacy Policy has been updated.

Your Privacy Matters:

Sipmaa mission is to connect the world’s professionals to allow them to be more productive and successful. Central to this mission is our commitment to be transparent about the data we collect about you, how it is used and with whom it is shared.

This Privacy Policy applies when you use our Services. We offer our users choices about the data we collect, use and share as described in this Privacy Policy, Cookie Policy, Settings and our Help Center.


Introduction:
We are a social network and online platform for professionals. People use our Services to find and be found for business opportunities, to connect with others and find information. Our Privacy Policy applies to any Member or

Services:
This Privacy Policy, including our Cookie Policy applies to your use of our Services.

This Privacy Policy applies to Sipmaa, Sipmaa -branded apps,Sipmaa Learning and other Sipmaa-related sites, apps, communications and services (“Services”), including off-site Services, such as our ad services and the “Apply with Sipmaa” and “Share with Sipmaa” plugins, but excluding services that state that they are offered under a different privacy policy.
Sipmaa Corporation will be the controller of your personal data provided to, or collected by or for, or processed in connection with, our Services.
As a Visitor or Member of our Services, the collection, use and sharing of your personal data is subject to this Privacy Policy and other documents referenced in this Privacy Policy, as well as updates.
Information We Collect: 
We collect information you provide during registration, such as your name, email address, and professional details. We also collect data generated through your use of our platform, including profile information, connections, messages, and engagement with content.
Use of Information: 
We use the collected information to provide and personalize our services, connect professionals, enable communication, and improve user experience. This includes suggesting relevant content, job opportunities, and connections, as well as enhancing our advertising targeting capabilities.
Data Sharing: 
We may share your information with trusted third parties, including service providers and partners, to assist us in delivering our services and enhancing your Sipmaa experience. We do not sell your personal information to advertisers or other third parties.
Control over Your Information:
 You have control over the information you provide on Sipmaa. You can manage your profile settings, choose what information to share publicly, and control the visibility of your connections and activities.
Communication: 
We may send you emails, notifications, and other messages related to your account and activity onSipmaa. You can manage your communication preferences and opt-out of certain types of messages.
Data Security: 
We employ industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, and destruction. We continuously monitor and update our systems to ensure the highest level of data protection.

Data Transfers:
Sipmaa operates globally, and your information may be transferred to and stored on servers located in different countries. We ensure that such transfers comply with applicable data protection laws.
Compliance: 
We comply with applicable privacy laws and regulations, including the European Union's General Data Protection Regulation (GDPR) and the California Consumer Privacy Act (CCPA).
Updates and Contact: 
We may update our Privacy Policy from time to time and will notify you of any significant changes. If you have questions, concerns, or requests regarding your privacy or data, you can contact us through the provided channels.
Sipmaa Privacy Policy aims to provide a general understanding of how we handle your data. For more detailed information, we encourage you to read our complete Privacy Policy available on our website. 
Contact Information:
If you have questions or complaints regarding this Policy, please first contact Sipmaa. You can also reach us by physical mail. If this does not resolve your complaint, Residents in the Designated Countries and other regions may have more options under their laws.
''',style: TextStyle(fontWeight: FontWeight.w500),),
        )
      ],
    );
  }
}

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(
  '''Terms and conditions:
''',
  style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  ),
),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
           '''The legal agreement between Sipmaa and its users regarding the use of their platform in Sipmaa terms and conditions. 

User obligations and responsibilities: The terms outline the user's obligations when using the platform, including adherence to legal requirements, the accuracy of information provided, and appropriate behaviour.

Account creation and usage: section describes how to set up an account, what qualifications are necessary, and what obligations the user has to protect the privacy of their account information.

Intellectual property rights: Sipmaa terms address the ownership of content shared on the platform, including copyrights, trademarks, and licences.

Privacy and data protection: This section details how Sipmaa collects, uses, stores, and protects user data. It may include information about cookies, tracking technologies, and the choices users have regarding their privacy settings.

Prohibited actions include: Sipmaa terms typically outline activities that are not allowed on the platform, such as spamming, impersonation, and violations of intellectual property rights.

Resolution and termination of disputes: This section may include information about resolving disputes, limitations of liability, and the circumstances under which Sipmaa can terminate or suspend a user's account.

To access the specific terms of service for a related platform to Sipmaa, I recommend visiting the official website of that platform and locating the "Terms of Service," "Terms and Conditions," or a similar link usually found in the footer section of their webpages. By reviewing the terms directly from the official source, you can obtain the most accurate and up-to-date information regarding their specific terms of service.
''',style: TextStyle(fontWeight: FontWeight.w500),),
        )
      ],
    );
  }
}
