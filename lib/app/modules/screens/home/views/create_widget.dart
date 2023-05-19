import 'package:flutter/material.dart';

import '../../../../data/components/constands/constands.dart';

class CreateWidget extends StatefulWidget {
  const CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
          color: kwhite,
          boxShadow: <BoxShadow>[
            BoxShadow(offset: Offset(0.0, 0.7), blurRadius: 0.5, color: kgrey)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/createprofile.png',
                  height: 60,
                  fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mani Maran',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'HR Management',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )
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
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis  nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Row(
              children: [
                Text(
                  '#job  #newpost  #NewJob  #HR',
                  style: TextStyle(fontSize: 11, color: kblue),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 55, top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 0.26,
              decoration: BoxDecoration(
                  color: kgrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/createupload.png'),
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kblue,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.27, 45)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
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
                                    padding: const EdgeInsets.only(top: 20),
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
                                        onPressed: () {},
                                        child: Text(
                                          'Done',
                                          style: TextStyle(fontSize: 17),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
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
