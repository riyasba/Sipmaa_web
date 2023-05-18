import 'package:flutter/material.dart';

import '../../../../../constands.dart';
//import '../constands.dart';
class FillterWidget extends StatefulWidget {
  const FillterWidget({super.key});

  @override
  State<FillterWidget> createState() => _FillterWidgetState();
}

class _FillterWidgetState extends State<FillterWidget> {
 bool _isfavorite=false; 
bool _isfavorite2=false; 
var commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 700,
          width: 150,
          color: kwhite,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10),
                child: Row(
                  children: [
                    Text('Fillter',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),)
                  ],
                ),
              ),
              ksizedbox10,
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kwhite)
              ),
              onPressed: (){}, 
            child: Text('All'))
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
           
            Container(
              height: MediaQuery.of(context).size.height*0.88,
              width: MediaQuery.of(context).size.width*0.38,
              decoration: BoxDecoration(
                 color: kwhite,
                 boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0.0, 0.7),
                    blurRadius: 0.5,
                    color: kgrey
                  )
                 ],
                 borderRadius: BorderRadius.circular(10)
              ),
             
              
              child:    Column(
                    children: [
                      ksizedbox10,
                       
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ksizedbox10,
                          SizedBox(
                            width: 20,
                          ),
                         
                          Row(children:[
                             Image.asset('assets/images/profile.png.png',
                             fit: BoxFit.fitHeight,height: 80,)]),
                             ksizedbox10,
                             SizedBox(
                              width: 20,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 0),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Riyas',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black),),
                                   Text('Loream ipounum',style: TextStyle(fontSize: 14,),textAlign: TextAlign.start,)
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 180),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Text('2 days ago'),
                                 ],
                               ),
                             )
                        ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 35,top: 5),
                         child: Row(
                          children: [
                            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad \nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \ncommodo consequat.',
                            style: TextStyle(fontSize: 11.5),)
                          ],
                         ),
                       ),
                      
                       Padding(
                         padding: const EdgeInsets.only(left: 35,top: 20),
                         child: Row(children:[
                           Image.asset('assets/images/homeimage.png.png',
                           height: 220,fit: BoxFit.fitHeight,)]),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                        
                           children: [
                             Row(
                               children: [
                                 IconButton(onPressed: (){
                                    setState(() {
                       
                                    
                                    });
                                 }, icon:
                                 Icon(Icons.favorite,color: Colors.pink,size: 15,)),
                                 Text('80K',
                                 style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),),
                                
                               ],
                             ),
                             SizedBox(
                              width: MediaQuery.of(context).size.width*0.2,
                             ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text('80K comments',style: TextStyle(fontSize: 13),),
                              )
                           ],
                         ),
                       ),
                       
                       Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         child: Divider(
                          color: Colors.black,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                             IconButton(onPressed: (){
                              setState(() {
                                _isfavorite=!_isfavorite;
                              });
                             }, 
                             icon: _isfavorite==true?Icon(Icons.favorite,color: Colors.pink,):
                             Icon(Icons.favorite_border)),
                             Padding(
                               padding: const EdgeInsets.only(top: 5),
                               child: Icon(Icons.comment_rounded),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 30,right: 30),
                         child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(15),
                      
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.80),
                            color: kgrey.withOpacity(0.4),
                            blurRadius: 0.2
                          )
                        ]
                          ),
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: '  Write Comment',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 1),
                                child: Image.asset('assets/images/profile.png.png',
                                height: 5,fit: BoxFit.fitHeight,),
                              ),
                              border: OutlineInputBorder(
                       borderSide: BorderSide.none
                              )
                            ),),
                         ),
                       )
                    ],
                  ),
                
            ),
          ],
        ),
      ],
    );
  }
}