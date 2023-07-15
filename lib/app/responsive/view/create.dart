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
     
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                                  'assets/images/propic.jpg',
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
                          if (textController.text.isNotEmpty) {
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
            ),
          ],
        ),
      ),
    );
  }
}






















