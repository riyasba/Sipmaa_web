import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';
import 'package:reg_login/app/data/models/notification_model.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import '../../../../data/components/controllers/posts_controller.dart';
import '../../../../data/components/controllers/profile_controller.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool _isfavorite = false;
  bool _isfavorite2 = false;
  var commentController = TextEditingController();
  var dialogeController = TextEditingController();
  final postController = Get.find<PostsController>();
  final profileController = Get.find<ProfileController>();
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    profileController.getNotificationList();
  }

  redirectToPages({dynamic response}) async {
    NotificationDataModel notificationModel =
        NotificationDataModel.fromJson(response);

    if (notificationModel.type == "like_Post") {
      homeController.homeindex(4);
    } else if (notificationModel.type == "comment_Post") {
      homeController.homeindex(4);
    } else if (notificationModel.type == "Friend_Request") {
      homeController.homeindex(0);
    } else if (notificationModel.type == "Friend_Request_accepted") {
      homeController.homeindex(0);
    } else {
      homeController.homeindex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 700,
          width: MediaQuery.of(context).size.width * 0.28,
          color: kwhite,
          child: GetBuilder<ProfileController>(builder: (_) {
            return profileController.notificationList.isEmpty
                ? const Center(
                    child: Text("No Data"),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: profileController.notificationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          var data = jsonDecode(
                              profileController.notificationList[index].data);

                          redirectToPages(response: data);
                        },
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/icons/profile_icon.png'),
                          ),
                          title: Row(
                            children: [
                              Text(
                                profileController.notificationList[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          subtitle: Text(profileController
                              .notificationList[index].message),
                          trailing: const Text(
                            '',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                  );
          }),
          // child: Column(
          //   children: [
          //     ksizedbox20,
          //     Padding(
          //       padding: const EdgeInsets.only(left: 15),
          //       child: Row(
          //         children: [
          //           Text('Notifications',style: TextStyle(fontSize: 16,
          //           fontWeight: FontWeight.bold),)
          //         ],
          //       ),
          //     ),
          //     ksizedbox20,
          //     Padding(
          //       padding: const EdgeInsets.only(left: 20),
          //       child: Row(
          //         children: [
          //          Image.asset('assets/images/profile.png',height: 50,fit: BoxFit.fitHeight,),
          //          Padding(
          //            padding: const EdgeInsets.only(left: 15),
          //            child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //              children: [
          //                Text('Prakash Raj commented on ',
          //                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
          //                Text('Tamil new year post',style: TextStyle(fontSize: 12,
          //                fontWeight: FontWeight.bold),)
          //              ],
          //            ),
          //          ),
          //          Padding(
          //            padding: const EdgeInsets.only(left: 30),
          //            child: Text('2 Hours ago',style: TextStyle(
          //             fontSize: 12
          //            ),),
          //          )
          //         ],
          //       ),
          //     ),
          //     ksizedbox20,

          //   ],
          // ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 50),
        //   child: Container(
        //     height: MediaQuery.of(context).size.height*0.88,
        //     width: MediaQuery.of(context).size.width*0.38,
        //     decoration: BoxDecoration(
        //        color: kwhite,
        //        boxShadow: <BoxShadow>[
        //         BoxShadow(
        //           offset: Offset(0.0, 0.7),
        //           blurRadius: 0.5,
        //           color: kgrey
        //         )
        //        ],
        //        borderRadius: BorderRadius.circular(10)
        //     ),

        //     child: Column(
        //       children: [
        //         ksizedbox10,

        //          Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             ksizedbox10,
        //             SizedBox(
        //               width: 20,
        //             ),
        //             Row(children:[
        //                Image.asset('assets/images/profile.png',
        //                fit: BoxFit.fitHeight,height: 80,)]),
        //                ksizedbox10,
        //                SizedBox(
        //                 width: 20,
        //                ),
        //                Padding(
        //                  padding: const EdgeInsets.only(left: 0),
        //                  child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                    children: [
        //                      Text('Sharmila',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black),),
        //                      Text('Loream ipounum',style: TextStyle(fontSize: 14,),textAlign: TextAlign.start,)
        //                    ],
        //                  ),
        //                ),
        //                Padding(
        //                  padding: const EdgeInsets.only(left: 180),
        //                  child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                    children: [
        //                      Text('2 days ago'),
        //                    ],
        //                  ),
        //                )
        //           ],
        //          ),
        //          Padding(
        //            padding: const EdgeInsets.only(left: 35,top: 5),
        //            child: Row(
        //             children: [
        //               Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \ncommodo consequat.',
        //               style: TextStyle(fontSize: 11.5),)
        //             ],
        //            ),
        //          ),

        //          Padding(
        //            padding: const EdgeInsets.only(left: 35,top: 20),
        //            child: Row(children:[
        //              Image.asset('assets/images/homeimage.png',
        //              height: 220,fit: BoxFit.fitHeight,)]),
        //          ),
        //          Padding(
        //            padding: const EdgeInsets.only(left: 20),
        //            child: Row(

        //              children: [
        //                Row(
        //                  children: [
        //                    IconButton(onPressed: (){
        //                       setState(() {

        //                       showDialog(context: context,
        //                       builder: (context){
        //                         return Padding(
        //                           padding: const EdgeInsets.only(top: 70,bottom: 50),
        //                           child: Dialog(
        //                             shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(15)
        //                             ),
        //                           child: Container(

        //                             decoration: BoxDecoration(

        //                             ),
        //                             height: 440,
        //                             width: 290,
        //                           child: Column(
        //                             children: [
        //                               ksizedbox10,
        //                               Row(
        //                                 children: [
        //                                   IconButton(
        //                                     onPressed: (){
        //                                       Get.back();
        //                                     },
        //                                     icon: Icon(Icons.arrow_back)),
        //                                     Text('Reactions',
        //                                     style: TextStyle(
        //                                       fontSize: 16,fontWeight: FontWeight.w900),)
        //                                 ],
        //                               ),
        //                               ksizedbox10,
        //                               Row(

        //                                 children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Image.asset('assets/images/profile.png',height: 50,
        //                                   fit: BoxFit.fitHeight,),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment: CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text('Krishna',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold
        //                                       ),),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 3),
        //                                         child: Text('Like in a post',
        //                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 90),
        //                                   child: Text('2 Hours ago',style: TextStyle(
        //                                     fontSize: 10
        //                                   ),),
        //                                 )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                                Row(

        //                                 children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Image.asset('assets/images/profile.png',height: 50,
        //                                   fit: BoxFit.fitHeight,),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment: CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text('Krishna',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold
        //                                       ),),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 3),
        //                                         child: Text('Like in a post',
        //                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 90),
        //                                   child: Text('2 Hours ago',style: TextStyle(
        //                                     fontSize: 10
        //                                   ),),
        //                                 )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                                Row(

        //                                 children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Image.asset('assets/images/profile.png',height: 50,
        //                                   fit: BoxFit.fitHeight,),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment: CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text('Krishna',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold
        //                                       ),),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 3),
        //                                         child: Text('Like in a post',
        //                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 90),
        //                                   child: Text('2 Hours ago',style: TextStyle(
        //                                     fontSize: 10
        //                                   ),),
        //                                 )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                                Row(

        //                                 children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Image.asset('assets/images/profile.png',height: 50,
        //                                   fit: BoxFit.fitHeight,),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment: CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text('Krishna',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold
        //                                       ),),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 3),
        //                                         child: Text('Like in a post',
        //                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 90),
        //                                   child: Text('2 Hours ago',style: TextStyle(
        //                                     fontSize: 10
        //                                   ),),
        //                                 )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                                Row(

        //                                 children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Image.asset('assets/images/profile.png',height: 50,
        //                                   fit: BoxFit.fitHeight,),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment: CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text('Krishna',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold
        //                                       ),),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 3),
        //                                         child: Text('Like in a post',
        //                                         style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(left: 90),
        //                                   child: Text('2 Hours ago',style: TextStyle(
        //                                     fontSize: 10
        //                                   ),),
        //                                 )
        //                                 ],
        //                               ),

        //                             ],
        //                           ),
        //                                                  ),
        //                           ),
        //                         );
        //                       });
        //                       });
        //                    }, icon:
        //                    Icon(Icons.favorite,color: Colors.pink,size: 15,)),
        //                    Text('80K',
        //                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),),

        //                  ],
        //                ),
        //                SizedBox(
        //                 width: MediaQuery.of(context).size.width*0.2,
        //                ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 20),
        //                   child: InkWell(
        //                     onTap: (){
        //                       setState(() {
        //                         showDialog(context: context, builder: (context){
        //                           return Padding(
        //                             padding: const EdgeInsets.only(left: 110),
        //                             child: Row(
        //                               children: [
        //                                 Container(
        //                                   height: 350,
        //                                   width: MediaQuery.of(context).size.width*0.56,
        //                                   decoration: BoxDecoration(
        //                                     color: kwhite
        //                                   ),
        //                                   child: Row(
        //                                     children: [
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(left: 15),
        //                                         child: Row(
        //                                           children: [
        //                                             Image.asset('assets/images/searchimage1.png',
        //                                            height: MediaQuery.of(context).size.height*0.5,
        //                                             fit: BoxFit.cover,)
        //                                           ],
        //                                         ),
        //                                       ),

        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 35,left: 20),
        //                                         child: Container(
        //                                           child: Column(
        //                                             children: [
        //                                               Row(
        //                                                 crossAxisAlignment: CrossAxisAlignment.start,
        //                                                    children: [
        //                                                       Image.asset('assets/images/profile.png',height: 50,
        //                                                       fit: BoxFit.fitHeight,),
        //                                                       Padding(
        //                                                         padding: const EdgeInsets.only(top: 7,left: 13),
        //                                                         child: Column(
        //                                                           crossAxisAlignment: CrossAxisAlignment.start,
        //                                                           children: [
        //                                                             Text('Akash',
        //                                                             style: TextStyle(
        //                                                               fontWeight: FontWeight.bold
        //                                                             ),),
        //                                                             Padding(
        //                                                               padding: const EdgeInsets.only(top: 2),
        //                                                               child: Text('Day addmition opend sir!',
        //                                                               style:TextStyle(fontSize: 11.3,
        //                                                               fontWeight: FontWeight.w600) ,),
        //                                                             )
        //                                                           ],
        //                                                         ),
        //                                                       ),
        //                                                       Padding(
        //                                                         padding: const EdgeInsets.only(left: 120,top: 10),
        //                                                         child: Text('2 Hours ago',
        //                                                         style: TextStyle(fontSize: 11),),
        //                                                       )
        //                                                                                 ],
        //                                                                               ),
        //                                                                               Padding(
        //                                         padding: const EdgeInsets.only(top: 10,left: 0),
        //                                         child: Container(
        //                                           child: Row(
        //                                             crossAxisAlignment: CrossAxisAlignment.start,
        //                                                children: [
        //                                                   Image.asset('assets/images/profile.png',height: 50,
        //                                                   fit: BoxFit.fitHeight,),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(top: 7,left: 13),
        //                                                     child: Column(
        //                                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                                       children: [
        //                                                         Text('Akash',
        //                                                         style: TextStyle(
        //                                                           fontWeight: FontWeight.bold
        //                                                         ),),
        //                                                         Padding(
        //                                                           padding: const EdgeInsets.only(top: 2),
        //                                                           child: Text('Day addmition opend sir!',
        //                                                           style:TextStyle(fontSize: 11.3,
        //                                                           fontWeight: FontWeight.w600) ,),
        //                                                         )
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(left: 120,top: 10),
        //                                                     child: Text('2 Hours ago',
        //                                                     style: TextStyle(fontSize: 11),),
        //                                                   )
        //                                                                             ],
        //                                                                           ),

        //                                         ),
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 10,left: 0),
        //                                         child: Container(
        //                                           child: Row(
        //                                             crossAxisAlignment: CrossAxisAlignment.start,
        //                                                children: [
        //                                                   Image.asset('assets/images/profile.png',height: 50,
        //                                                   fit: BoxFit.fitHeight,),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(top: 7,left: 13),
        //                                                     child: Column(
        //                                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                                       children: [
        //                                                         Text('Akash',
        //                                                         style: TextStyle(
        //                                                           fontWeight: FontWeight.bold
        //                                                         ),),
        //                                                         Padding(
        //                                                           padding: const EdgeInsets.only(top: 2),
        //                                                           child: Text('Day addmition opend sir!',
        //                                                           style:TextStyle(fontSize: 11.3,
        //                                                           fontWeight: FontWeight.w600) ,),
        //                                                         )
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(left: 120,top: 10),
        //                                                     child: Text('2 Hours ago',
        //                                                     style: TextStyle(fontSize: 11),),
        //                                                   )
        //                                                                             ],
        //                                                                           ),
        //                                         ),
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(top: 10,left: 0),
        //                                         child: Container(
        //                                           child: Row(
        //                                             crossAxisAlignment: CrossAxisAlignment.start,
        //                                                children: [
        //                                                   Image.asset('assets/images/profile.png',height: 50,
        //                                                   fit: BoxFit.fitHeight,),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(top: 7,left: 13),
        //                                                     child: Column(
        //                                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                                       children: [
        //                                                         Text('Akash',
        //                                                         style: TextStyle(
        //                                                           fontWeight: FontWeight.bold
        //                                                         ),),
        //                                                         Padding(
        //                                                           padding: const EdgeInsets.only(top: 2),
        //                                                           child: Text('Day addmition opend sir!',
        //                                                           style:TextStyle(fontSize: 11.3,
        //                                                           fontWeight: FontWeight.w600) ,),
        //                                                         )
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                   Padding(
        //                                                     padding: const EdgeInsets.only(left: 120,top: 10),
        //                                                     child: Text('2 Hours ago',
        //                                                     style: TextStyle(fontSize: 11),),
        //                                                   )
        //                                                                             ],
        //                                                                           ),
        //                                         ),
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(left: 1,right: 65),
        //                                         child: Row(
        //                                           children: [
        //                                             Container(
        //                                               height: 1,
        //                                               width: 65,
        //                                               color: Colors.black.withOpacity(0.6),
        //                                             ),
        //                                             Padding(
        //                                               padding: const EdgeInsets.only(left: 10),
        //                                               child: Text('view 3 more replies',
        //                                               style: TextStyle(fontSize: 11.1,
        //                                               fontWeight: FontWeight.w600),),
        //                                             )
        //                                           ],
        //                                         ),
        //                                       ),

        //                                             ],
        //                                           ),
        //                                         ),
        //                                       ),

        //                                     ],
        //                                   ),
        //                                 ),

        //                               ],
        //                             ),
        //                           );
        //                         });

        //                       });
        //                     },
        //                     child: Text('80K comments',style: TextStyle(fontSize: 13),)),
        //                 )
        //              ],
        //            ),
        //          ),

        //          Padding(
        //            padding: const EdgeInsets.only(left: 10,right: 10),
        //            child: Divider(
        //             color: Colors.black,
        //            ),
        //          ),
        //          Padding(
        //            padding: const EdgeInsets.only(left: 20),
        //            child: Row(
        //              children: [
        //                IconButton(onPressed: (){
        //                 setState(() {
        //                   _isfavorite=!_isfavorite;
        //                 });
        //                },
        //                icon: _isfavorite==true?Icon(Icons.favorite,color: Colors.pink,):
        //                Icon(Icons.favorite_border)),
        //                Padding(
        //                  padding: const EdgeInsets.only(top: 5),
        //                  child: Icon(Icons.comment_rounded),
        //                )
        //              ],
        //            ),
        //          ),
        //          Padding(
        //            padding: const EdgeInsets.only(left: 30,right: 30),
        //            child: Container(
        //             decoration: BoxDecoration(
        //               color: Colors.white.withOpacity(0.75),
        //           borderRadius: BorderRadius.circular(15),

        //           boxShadow: <BoxShadow>[
        //             BoxShadow(
        //               offset: Offset(0.0, 0.80),
        //               color: kgrey.withOpacity(0.4),
        //               blurRadius: 0.2
        //             )
        //           ]
        //             ),
        //             height: 42,
        //             width: MediaQuery.of(context).size.width,

        //             child: TextField(
        //               controller: commentController,
        //               decoration: InputDecoration(
        //                 hintText: '  Write Comment',
        //                 hintStyle: TextStyle(
        //                   fontSize: 12,
        //                   color: Colors.black
        //                 ),
        //                 prefixIcon: Padding(
        //                   padding: const EdgeInsets.only(left: 10,top: 1),
        //                   child: Image.asset('assets/images/profile.png',
        //                   height: 10,fit: BoxFit.fitHeight,),
        //                 ),
        //                 border: OutlineInputBorder(
        //          borderSide: BorderSide.none
        //                 )
        //               ),),
        //            ),
        //          )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
