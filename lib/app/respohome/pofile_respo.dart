import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

import 'package:velocity_x/velocity_x.dart';

class ProfileRespo extends StatelessWidget {
  const ProfileRespo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Container(
            child: Column(
              children: [
                ksizedbox20,
                Image.asset(
                  'assets/images/Mask Group 32.png',
                  height: 100,
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('RIYAS   ').text.bold.xl.make(),
                    Icon(
                      Icons.edit,
                      color: kblue,
                      size: 17,
                    )
                  ],
                ),
                Text('Students at university of calicut').text.bold.make(),
                ksizedbox20,
                Divider(
                  height: 0.5,
                  color: kgrey,
                ),
                ksizedbox10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        kwidth10,
                        Text('Company :').text.sm.make(),
                      ],
                    ),
                    Row(
                      children: [
                        kwidth10,
                        Text('Sipmaa Company ').text.sm.make(),
                      ],
                    ),
                    ksizedbox10,
                  ],
                ),
                Divider(
                  height: 0.5,
                  color: kgrey,
                ),
                ksizedbox10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        kwidth10,
                        Text('Job :').text.sm.make(),
                      ],
                    ),
                    Row(
                      children: [
                        kwidth10,
                        Text('Sipmaa Company ').text.sm.make(),
                      ],
                    ),
                    ksizedbox10,
                    Divider(
                      height: 0.5,
                      color: kgrey,
                    ),
                  ],
                ),
                ksizedbox20,
                Row(
                  children: [
                    kwidth10,
                    Text('About :').text.sm.bold.make(),
                  ],
                ),
                Row(
                  children: [
                    kwidth10,
                    Text('Hey i am using sipma').text.sm.make(),
                  ],
                ),
                ksizedbox10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            kwidth10,
                            Text('Posters').text.semiBold.make(),
                            Spacer(),
                            Text('12k').text.semiBold.make(),
                            kwidth10
                          ],
                        ),
                        ksizedbox10,
                        Divider(
                          height: 1,
                        ),
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            kwidth10,
                            Text('Like').text.semiBold.make(),
                            Spacer(),
                            Text('42k').text.semiBold.make(),
                            kwidth10
                          ],
                        ),
                        ksizedbox10,
                        Divider(
                          height: 1,
                        ),
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            kwidth10,
                            Text('Friends').text.semiBold.make(),
                            Spacer(),
                            Text('2k').text.semiBold.make(),
                            kwidth10
                          ],
                        ),
                        ksizedbox10,
                      ],
                    ),
                    width: size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kgrey,
                        width: 0.5,
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(8)),
            width: size.width,
            height: size.height * 0.7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(92, 92),
                backgroundColor: kwhite.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {
              {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: kwhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              ksizedbox10,
                              const Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Do you want to Logout ?',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
                              ksizedbox30,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 80,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF3C73B1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed('/sign-in');
                                        },
                                        // Get.to(

                                        // BottomNavigationBarExample(),
                                        //);

                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 80,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF3C73B1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        // Get.to(

                                        // BottomNavigationBarExample(),
                                        //);

                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kwidth10,
                Image.asset(
                  'assets/images/Mask Group 32.png',
                  height: 35,
                ),
                kwidth10,
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 14),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 1),
                    //   child: Text(
                    //     'Developer',
                    //     style: TextStyle(
                    //         fontSize: 8,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.w800),
                    //   ),
                    // )
                  ],
                ),
                kwidth10,
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 0),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
