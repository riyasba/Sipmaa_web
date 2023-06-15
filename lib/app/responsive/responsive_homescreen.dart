import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';


import 'respologin.dart';

import 'mobile_homescreenn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ResponsiveLayout(
      desktopbody: HomePage(),
      mobilebody: loginpagerespo(),
    ));
  }
}
