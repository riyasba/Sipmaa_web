import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

class appbar extends StatelessWidget {
  const appbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      backgroundColor: kblue,
    );
  }
}
