import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/components/constands/constands.dart';


class RecivedImageView extends StatelessWidget {
  String image;
  String timestamp;
  RecivedImageView({
    required this.image,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 0, 7),
          child: Container(
            height: 280,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 240, 240, 240),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: primaryfont.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //Activity container
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 200,
                      width: size.width * 0.5,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //activity container end here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Text(
                          DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                              int.parse(timestamp),
                            ),
                          ),
                          style: primaryfont.copyWith(
                              color: Colors.black45, fontSize: 11),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
