import 'package:flutter/material.dart';
import 'package:reg_login/app/modules/authentication/register/views/register.dart';
import 'package:reg_login/app/responsive/mobile_homescreenn.dart';
import 'package:reg_login/app/responsive/view/mob_register_details_page.dart';

class RegisterFormDetailsResponsive extends StatefulWidget {
  const RegisterFormDetailsResponsive({super.key});

  @override
  State<RegisterFormDetailsResponsive> createState() => _RegisterFormDetailsResponsiveState();
}

class _RegisterFormDetailsResponsiveState extends State<RegisterFormDetailsResponsive> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ResponsiveLayout(
      desktopbody:ResgisterDetailsWeb(),
      mobilebody: RegisterDetailsMobView(),
    ));
  }
}