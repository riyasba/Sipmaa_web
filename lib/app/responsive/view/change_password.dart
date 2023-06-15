import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../data/components/constands/constands.dart';
import '../../data/components/controllers/profile_controller.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _isObscure = true;
  bool _isvalue = true;
  bool _isvalue2 = true;
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confrmPasswordController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: kblue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: _isObscure,
              controller: oldPasswordController,
              decoration: InputDecoration(
                  hintText: 'Old Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: _isvalue,
              controller: newPasswordController,
              decoration: InputDecoration(
                  hintText: 'New Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isvalue = !_isvalue;
                      });
                    },
                    icon: _isvalue
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: _isvalue2,
              controller: confrmPasswordController,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isvalue2 = !_isvalue2;
                        });
                      },
                      icon: _isvalue2
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(150, 45),
                  backgroundColor: kblue),
              onPressed: () {
                if (oldPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty &&
                    confrmPasswordController.text.isNotEmpty) {
                  profileController.changePassword(
                      oldPassword: oldPasswordController.text,
                      currentPassword: newPasswordController.text,
                      condirmPassword: confrmPasswordController.text);
                }
              },
              child: Text(
                'Update',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
