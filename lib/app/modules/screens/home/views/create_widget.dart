import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reg_login/app/data/components/controllers/posts_controller.dart';
import '../../../../data/components/constands/constands.dart';




class CreateWidget extends StatefulWidget {
  const  CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  final postsController = Get.find<PostsController>();

  var textController = TextEditingController();

  File? image;

  var imagePath;

  chooseImage() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
   
    

        final croppedImage = await ImageCropper().cropImage(
                      sourcePath: pickedFile!.path,
                       aspectRatioPresets: [CropAspectRatioPreset.ratio7x5],
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: kblue,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                          WebUiSettings(
                          context: context,
                            boundary: const CroppieBoundary(
              width: 400,
              height: 300,
            ),
                          presentStyle: CropperPresentStyle.dialog,
                            enableExif: true,
            enableZoom: true,
            showZoomer: true,
                          viewPort: CroppieViewPort( width: 400, height: (400*0.5).round(), type: "square" )

                        ),
                      ],
                    );
                     imagePath = await croppedImage!.readAsBytes();
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
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          if (postsController.profileData.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Row(
                children: [
                  postsController.profileData.first.profilePicture == null
                      ? CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/propic.jpg',
                          ),
                          radius: 35,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                            postsController.profileData.first.profilePicture,
                          ),
                          radius: 35,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        //       postsController.profileData.first.department
                        //           .toString(),
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
                  decoration:
                      const InputDecoration.collapsed(hintText: "Type..."),
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
            height: MediaQuery.of(context).size.height * 0.34,
            width: MediaQuery.of(context).size.width * 0.26,
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
                            height: 150,
                            width: 350,
                            child: Image.memory(
                              imagePath,
                              fit: BoxFit.contain,
                            )),
                  ),
                ],
              ),
            ),
          ),//ksizedbox10,
          ksizedbox20,
          Obx(
            () => postsController.isLoading.isTrue
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kblue,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.27, 45)),
                    onPressed: () async {
                      if (textController.text.isNotEmpty ||
                          imagePath != null) {
                        int response = await postsController.uplodPost(
                            title: textController.text,
                            description: "",
                            media: imagePath);
                        Get.back();
                        if (response == 201) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.2,
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
                                            padding: const EdgeInsets.only(
                                                top: 20),
                                            child: Text(
                                              'Your Post has Successfully Posted',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w900),
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
                                                  postsController
                                                      .getAllPost();
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
                    )),
          )
        ],
      ),
    );
  }
}


