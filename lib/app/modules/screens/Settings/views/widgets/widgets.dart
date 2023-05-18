import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Textformfield extends StatelessWidget {
   Textformfield({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                decoration: InputDecoration(hintText: text,
                  border: OutlineInputBorder())) ;
  }
}