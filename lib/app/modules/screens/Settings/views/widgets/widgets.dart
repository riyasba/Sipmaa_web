import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class Textformfield extends StatelessWidget {
   Textformfield({super.key, required this.text, required this.controller});
final String text;

final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: controller,
                decoration: InputDecoration(hintText: text,
                hintStyle: TextStyle(
                  //fontWeight: FontWeight.w700
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ))) ;
  }
}