import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:reg_login/app/responsive/mobile_homescreenn.dart';


import '../../modules/authentication/signin/views/signin.dart';
import '../respologin.dart';




class LoginRespoView extends StatefulWidget {
  const LoginRespoView({super.key});

  @override
  State<LoginRespoView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginRespoView> {
  @override
  Widget build(BuildContext context) {
    //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ResponsiveLayout(
      desktopbody:SignInView(),
      mobilebody: loginpagerespo(),
    ));
  }
}
