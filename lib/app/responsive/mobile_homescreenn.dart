import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobilebody;
  final Widget desktopbody;

  const ResponsiveLayout({super.key,required this.mobilebody,required this.desktopbody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints){
        if(contraints.maxWidth < 600){
          return mobilebody;
        }else{
          return desktopbody;
        }
      }
    );
  }
}