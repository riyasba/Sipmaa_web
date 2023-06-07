import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  TextformfieldWidget({
    this.text,
    super.key,
    this.controller,
    this.textt,
    bool? autofocus,
  });
  // final String? Function(String?)? validator;
  String? text;
  String? textt;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textt!,
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration( floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: text,border: OutlineInputBorder()),
            // controller: controller,
            // // validator: validator,
            // decoration: InputDecoration(
            //   floatingLabelBehavior: FloatingLabelBehavior.never,
            //   fillColor: Colors.grey[250],
            //   labelText: text,
            //   hintStyle: TextStyle(
            //     color: Colors.grey[500],
            //   ),
            //   border: InputBorder.none,
            //   filled: true,
            //   focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //         color: Color.fromARGB(0, 158, 158, 158), width: 2.0),
            //     borderRadius: BorderRadius.circular(16.0),
            //   ),
            //   contentPadding: EdgeInsets.fromLTRB(17.0, 8.0, 17.0, 7.0),
            // ),
          ),
        ],
      ),
    );
  }
}
