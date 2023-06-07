import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reg_login/app/data/models/controllers/auth_controllers.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';

import 'app/modules/screens/Settings/controllers/controllers.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(HomeController());
   Get.put(SettingsController());
   Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     // home: HomePage(),
         initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,   );
      
  }
}


