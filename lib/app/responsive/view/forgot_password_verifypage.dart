import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';



import '../../data/components/constands/constands.dart';


class forgotpasswordverifiypage extends StatefulWidget {
  const forgotpasswordverifiypage({super.key});

  @override
  State<forgotpasswordverifiypage> createState() =>
      _forgotpasswordverifiypageState();
}

class _forgotpasswordverifiypageState extends State<forgotpasswordverifiypage> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() => HomepageRespo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         //   kverifiyforgotimage,
            ksizedbox30,
            Text(
              'Password has been sent to Your Email ',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
