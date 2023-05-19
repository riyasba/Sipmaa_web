import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/components/constands/constands.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

int index = 0;
List postimage = [
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Group 89.png',
  'assets/images/Rectangle 807.png'
];

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width:  MediaQuery.of(context).size.width * 0.874,
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(color: kwhite,
                  width: MediaQuery.of(context).size.width * 0.874,
                  child: Image.asset(
                    'assets/images/Rectangle 800.png',
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  left: 50, child: Image.asset('assets/images/createprofile.png'))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riyas',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                ksizedbox10,
                Text(
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt\n ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          ksizedbox40,
          Container(
            width: MediaQuery.of(context).size.width * 0.874,
            child: Row(
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
          ),ksizedbox30,Padding(
            padding: const EdgeInsets.all(16.0),
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
          ),ksizedbox30,
          Container(
              height: 500,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
