// import 'package:flutter/material.dart';

// import '../../../../../data/components/constands/constands.dart';

// class FriendRequesWiget extends StatefulWidget {
//   const FriendRequesWiget({super.key});

//   @override
//   State<FriendRequesWiget> createState() => _FriendRequesWigetState();
// }

// class _FriendRequesWigetState extends State<FriendRequesWiget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10,top: 20),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/images/profile.png',fit: BoxFit.fitHeight,height: 30,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Kirshna',style: TextStyle(fontWeight: FontWeight.w900),),
//                           Text('HR community',style: TextStyle(fontSize: 11),)
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 6),
//                       child: ElevatedButton(onPressed: (){},
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)
//                           ),
//                           backgroundColor: kblue
//                         ),
//                       //   onPressed: (){
//                       //   setState(() {
//                       //     _accept=!_accept;
//                       //   });
//                       // }, 
//                       child: Text('Accept',style: TextStyle(color:kwhite,
//                       fontSize: 12),)),
//                     ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 6),
//                        child: ElevatedButton(onPressed: (){},
//                         style: ElevatedButton.styleFrom(
                          
//                           backgroundColor:kwhite,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)
//                           )
//                         ),
                      
//                        child: Text('Remove',style: TextStyle(color:kblue,
//                       fontSize: 12 ))),
//                      )
//                   ],
//                 ),
//               ),
//             );
//   }
// }