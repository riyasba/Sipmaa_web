import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../components/constands/constands.dart';


class friendrequest extends StatelessWidget {
  friendrequest({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  
  get kwhite => null;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            child: Stack(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:  AssetImage('assets/images/propic.jpg'),
                  ),
                  title: Text("Riyas"),
                  subtitle: Text("HR Communityy"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        text1,
                        style: TextStyle(
                            color: kwhite, fontWeight: FontWeight.w600),
                      )),
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: kblue),
                    ),kwidth10,
                    ksizedbox10,
                    Container(
                      child: Center(
                          child: Text(
                        text2,
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.w600),
                      )),
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: kblue, width: 1),
                          borderRadius: BorderRadius.circular(17),
                          color: kwhite),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
