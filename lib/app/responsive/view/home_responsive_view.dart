import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';
import 'package:reg_login/app/responsive/mobile_homescreenn.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';




class HomeRespoView extends StatefulWidget {
  const HomeRespoView({super.key});

  @override
  State<HomeRespoView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeRespoView> {
  @override
  Widget build(BuildContext context) {
    //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ResponsiveLayout(
      desktopbody:HomePage(),
      mobilebody: HomepageRespo(),
    ));
  }
}
