import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';

import '../../data/components/constands/constands.dart';

class CreateWidgetrespo extends StatefulWidget {
  const CreateWidgetrespo({super.key});

  @override
  State<CreateWidgetrespo> createState() => _CreateWidgetrespoState();
}

class _CreateWidgetrespoState extends State<CreateWidgetrespo> {
  final postsController = Get.find<PostsController>();

  var textController = TextEditingController();

  File? image;

  var imagePath;

  chooseImage() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    imagePath = await pickedFile!.readAsBytes();
    setState(() {
      // imageName = pickedFile.path.split(".").last;
    });
    // Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    // setState(() {
    //   imagePath = bytesFromPicker!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue,
        title: Text(
          'Create Post',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.88,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kwhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (postsController.profileData.isNotEmpty)
                  Row(
                    children: [
                      postsController.profileData.first.profilePicture == null
                          ? Image.asset(
                              'assets/images/createprofile.png',
                              height: 60,
                              //  width: 300,
                              fit: BoxFit.fitHeight,
                            )
                          : Image.network(
                              postsController.profileData.first.profilePicture,
                              height: 60,
                              fit: BoxFit.fitHeight,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (postsController.profileData.isNotEmpty)
                              Text(
                                '${postsController.profileData.first.name} ${postsController.profileData.first.lastName}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            // if (postsController.profileData.isNotEmpty)
                            //   Padding(
                            //     padding: const EdgeInsets.only(top: 3),
                            //     child: Text(
                            //       postsController.profileData.first.department,
                            //       style: TextStyle(
                            //         fontSize: 14,
                            //       ),
                            //     ),
                            //   )
                          ],
                        ),
                      ),
                    ],
                  ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Column(
                    children: [
                      TextField(
                        controller: textController,
                        maxLines: 5,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Type..."),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, top: 10),
                //   child: Row(
                //     children: [
                //       Text(
                //         '#job  #newpost  #NewJob  #HR',
                //         style: TextStyle(fontSize: 11, color: kblue),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: kgrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            chooseImage();
                          },
                          child: imagePath == null
                              ? Image.asset('assets/images/createupload.png')
                              : Container(
                                  height: 200,
                                  width: 350,
                                  child: Image.memory(
                                    imagePath,
                                    fit: BoxFit.contain,
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox20,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kblue,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.27, 45)),
                    onPressed: () async {
                      if (textController.text.isNotEmpty && imagePath != null) {
                        int response = await postsController.uplodPost(
                            title: textController.text,
                            description: "",
                            media: imagePath);
                        if (response == 201) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/Character.png',
                                                  fit: BoxFit.fitHeight,
                                                  height: 150,
                                                ),
                                              ]),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Text(
                                              'Your Post has Successfully Posted',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          ksizedbox30,
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 40),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kblue,
                                                    minimumSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        45)),
                                                onPressed: () {
                                                  postsController.getAllPost();
                                                  Get.find<HomeController>()
                                                      .homeindex(0);

                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Done',
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      } else {
                        Get.rawSnackbar(
                          messageText: const Text(
                            "Complete before posting",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        );
                      }
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
// import 'package:reg_login/app/modules/screens/home/controler/controler.dart';



// import '../../data/components/constands/constands.dart';

// class createpost extends StatefulWidget {
//   const createpost({super.key});

//   @override
//   State<createpost> createState() => _CreateWidgetState();
// }

// class _CreateWidgetState extends State<createpost> {
//   final postsController = Get.find<PostsController>();

//   var textController = TextEditingController();

//   File? image;

//   var imagePath;

//   chooseImage() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//     );
//     imagePath = await pickedFile!.readAsBytes();
//     setState(() {
//       // imageName = pickedFile.path.split(".").last;
//     });
//     // Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
//     // setState(() {
//     //   imagePath = bytesFromPicker!;
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.88,
//       width: MediaQuery.of(context).size.width * 0.38,
//       decoration: BoxDecoration(
//           color: kwhite,
//           boxShadow: <BoxShadow>[
//             BoxShadow(offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
//           ],
//           borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           if (postsController.profileData.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(left: 30, top: 15),
//               child: Row(
//                 children: [
//                   postsController.profileData.first.profilePicture == null
//                       ? Image.asset(
//                           'assets/images/createprofile.png',
//                           height: 60,
//                           fit: BoxFit.fitHeight,
//                         )
//                       : Image.network(
//                           postsController.profileData.first.profilePicture,
//                           height: 60,
//                           fit: BoxFit.fitHeight,
//                         ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (postsController.profileData.isNotEmpty)
//                           Text(
//                             '${postsController.profileData.first.name} ${postsController.profileData.first.lastName}',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                         if (postsController.profileData.isNotEmpty)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 3),
//                             child: Text(
//                               postsController.profileData.first.department,
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                           )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           Divider(
//             thickness: 1,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40, top: 10),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: textController,
//                   maxLines: 5,
//                   decoration:
//                       const InputDecoration.collapsed(hintText: "Type..."),
//                 ),
//               ],
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 40, top: 10),
//           //   child: Row(
//           //     children: [
//           //       Text(
//           //         '#job  #newpost  #NewJob  #HR',
//           //         style: TextStyle(fontSize: 11, color: kblue),
//           //       )
//           //     ],
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(right: 55, top: 10),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.42,
//               width: MediaQuery.of(context).size.width * 0.26,
//               decoration: BoxDecoration(
//                   color: kgrey.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         chooseImage();
//                       },
//                       child: imagePath == null
//                           ? Image.asset('assets/images/createupload.png')
//                           : Container(
//                               height: 200,
//                               width: 350,
//                               child: Image.memory(
//                                 imagePath,
//                                 fit: BoxFit.contain,
//                               )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           ksizedbox20,
//           Padding(
//             padding: const EdgeInsets.only(right: 50),
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: kblue,
//                     minimumSize:
//                         Size(MediaQuery.of(context).size.width * 0.27, 45)),
//                 onPressed: () async {
//                   if (textController.text.isNotEmpty && imagePath != null) {
//                     int response = await postsController.uplodPost(
//                         title: textController.text,
//                         description: "",
//                         media: imagePath);
//                     if (response == 201) {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return Dialog(
//                               child: Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.5,
//                                 width: MediaQuery.of(context).size.width * 0.2,
//                                 decoration: BoxDecoration(
//                                   color: kwhite,
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Image.asset(
//                                               'assets/images/Character.png',
//                                               fit: BoxFit.fitHeight,
//                                               height: 150,
//                                             ),
//                                           ]),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 20),
//                                         child: Text(
//                                           'Your Post has Successfully Posted',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w900),
//                                         ),
//                                       ),
//                                       ksizedbox30,
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 40, right: 40),
//                                         child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                                 backgroundColor: kblue,
//                                                 minimumSize: Size(
//                                                     MediaQuery.of(context)
//                                                             .size
//                                                             .width *
//                                                         0.2,
//                                                     45)),
//                                             onPressed: () {
//                                               postsController.getAllPost();
//                                               Get.find<HomeController>()
//                                                   .homeindex(0);
//                                             },
//                                             child: Text(
//                                               'Done',
//                                               style: TextStyle(fontSize: 17),
//                                             )),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     }
//                   } else {
//                     Get.rawSnackbar(
//                       messageText: const Text(
//                         "Complete before posting",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       backgroundColor: Colors.red,
//                     );
//                   }
//                 },
//                 child: Text(
//                   'Post',
//                   style: TextStyle(fontSize: 18),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }



















// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:image_picker/image_picker.dart';


// // import '../../data/components/constands/constands.dart';
// // import '../../data/components/controllers/posts_controller.dart';
// // import '../widgets/drawer.dart';


// // class createpost extends StatefulWidget {
// //   const createpost({super.key});

// //   @override
// //   State<createpost> createState() => _createpostState();
// // }

// // class _createpostState extends State<createpost> {
// //   final postsController = Get.find<PostsController>();

// //   var textController = TextEditingController();

// //   File? image;

// //   @override
// //   Widget build(BuildContext context) {
// //     //  var size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: kblue,
// //         title: GetBuilder<PostsController>(builder: (_) {
// //           return Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               const Text(
// //                 'Create Post',
// //                 style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.bold,),
// //               ),
// //               postsController.isLoading.isTrue
// //                   ? Container(
// //                       height: 26,
// //                       width: 60,
// //                       decoration: BoxDecoration(
// //                           color: kblue,
// //                           borderRadius: BorderRadiusDirectional.circular(18)),
// //                       child: Center(
// //                           child: Container(
// //                         height: 20,
// //                         width: 20,
// //                         child: const CircularProgressIndicator(
// //                           color: Colors.white,
// //                         ),
// //                       )),
// //                     )
// //                   : InkWell(
// //                       onTap: () {
// //                         if (textController.text.isNotEmpty && image != null) {
// //                           postsController.uplodPost(
// //                               title: textController.text,
// //                               description: "",
// //                               media: File(image!.path));
// //                         } else {
// //                           Get.rawSnackbar(
// //                             messageText: const Text(
// //                               "Complete before posting",
// //                               style: TextStyle(color: Colors.white),
// //                             ),
// //                             backgroundColor: Colors.red,
// //                           );
// //                         }
// //                       },
// //                       child: Container(
// //                         height: 26,
// //                         width: 60,
// //                         decoration: BoxDecoration(
// //                             color: kwhite,
// //                             borderRadius: BorderRadiusDirectional.circular(18)),
// //                         child: Center(
// //                             child: Text(
// //                           'Post',
// //                           style: TextStyle(color: kblue, fontSize: 15),
// //                         )),
// //                       ),
// //                     )
// //             ],
// //           );
// //         }),
// //       ),drawer: MobileDrawer(),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(15.0),
// //           child: GetBuilder<PostsController>(builder: (_) {
// //             return Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 ksizedbox40,
// //                 Row(
// //                   children: [
// //                     postsController.profileData.first.profilePicture == null
// //                         ? const CircleAvatar(
// //                             backgroundImage:
// //                                 AssetImage('assets/icons/profile_icon.png'),
// //                           )
// //                         : CircleAvatar(
// //                             backgroundImage: NetworkImage(postsController
// //                                 .profileData.first.profilePicture),
// //                           ),
// //                     const SizedBox(
// //                       width: 5,
// //                     ),
// //                     Text(
// //                       '${postsController.profileData.first.name}\n${postsController.profileData.first.userName}',
// //                       style: const TextStyle(fontSize: 15),
// //                     ),
// //                   ],
// //                 ),
// //                 ksizedbox10,
// //                 ksizedbox30,
// //                 const SizedBox(
// //                   height: 5,
// //                 ),
// //                 TextFormField(
// //                   controller: textController,
// //                   minLines: 4,
// //                   style: Theme.of(context).textTheme.headline6!.copyWith(
// //                         fontSize: 14,
// //                         color: Colors.black,
// //                         fontWeight: FontWeight.w300,
// //                       ),
// //                   maxLines: null,
// //                   keyboardType: TextInputType.multiline,
// //                   cursorHeight: 15,
// //                   decoration: InputDecoration(
// //                     border: InputBorder.none,
// //                     isDense: true,
// //                     contentPadding: EdgeInsets.all(
// //                       15,
// //                     ),
// //                     hintText: "What do you want to Talk about?",
// //                     hintStyle: TextStyle(
// //                       fontWeight: FontWeight.w400,
// //                       fontSize: 15,
// //                       color: Colors.grey[500],
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: BorderSide(width: 1, color: Colors.grey)),
// //                     enabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: BorderSide(width: 1.2, color: Colors.grey)),
// //                     disabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: BorderSide(width: 1.2, color: Colors.grey)),
// //                     errorBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: BorderSide(width: 1.2, color: Colors.grey)),
// //                     focusedErrorBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         borderSide: BorderSide(width: 1.2, color: Colors.grey)),
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return "Please enter your message";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 ksizedbox40,
// //                 InkWell(
// //                   onTap: () async {
// //                     final ImagePicker _picker = ImagePicker();
// //                     // Pick an image
// //                     final XFile? timage =
// //                         await _picker.pickImage(source: ImageSource.gallery);
// //                     setState(() {
// //                       image = File(timage!.path);
// //                     });
// //                   },
// //                   child: Container(
// //                     height: 30,
// //                     width: 70,
// //                     decoration: BoxDecoration(
// //                         color: kblue,
// //                         borderRadius: BorderRadiusDirectional.circular(18)),
// //                     child: Center(
// //                         child: Text(
// //                       'Upload',
// //                       style: TextStyle(color: kwhite, fontSize: 15),
// //                     )),
// //                   ),
// //                 ),
// //                 ksizedbox30,
// //                 if (image != null)
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: Image.file(File(image!.path)),
// //                   ),
// //               ],
// //             );
// //           }),
// //         ),
// //       ),
// //     );
// //   }
// // }
