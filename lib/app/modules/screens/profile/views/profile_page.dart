import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';

import '../../../../../constands.dart';
import '../../../../../widget/search_field.dart';

class ps extends StatefulWidget {
  const ps({super.key});

  @override
  State<ps> createState() => _psState();
}

TextEditingController textController = TextEditingController();

class _psState extends State<ps> {
  int index = 0;
  List postimage = [
    'assets/images/Group 89.png',
    'assets/images/Group 89.png',
    'assets/images/Group 89.png',
    'assets/images/Group 89.png',
    'assets/images/Group 89.png',
    'assets/images/Rectangle 807.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 112,
          width: MediaQuery.of(context).size.width,
          color: kblue,
          child: Image.asset(
            'assets/images/Rectangle 800.png',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/images/Icon metro-user-plus.png',
              ),
            ),
          ],
        ),
        Image.asset('assets/images/profile.png'),
        Padding(
          padding: const EdgeInsets.only(left: 1000, right: 100),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  backgroundColor: kblue,
                  minimumSize: Size(50, 40)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Icon metro-user-plus.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Request',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Riyas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            )),
        ksizedbox10,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        ksizedbox30,
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: kblue),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Friends',
                          style: TextStyle(
                              color: kwhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '4.4T',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: kblue),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Poster',
                          style: TextStyle(
                              color: kwhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '5.5k',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: kblue),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Likes',
                          style: TextStyle(
                              color: kwhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '2.5k',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: Row(
            children: [
              Text(
                'ALL Post',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 500,
            child: GridView.builder(
                itemCount: postimage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Image.asset(postimage[index]),
                  );
                }))
      ],
    );
  }
}
