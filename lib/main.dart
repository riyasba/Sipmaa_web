import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reg_login/app/data/components/controllers/auth_controllers.dart';
import 'package:reg_login/app/data/components/controllers/profile_controller.dart';
import 'package:reg_login/app/modules/screens/home/controler/controler.dart';
import 'app/data/components/controllers/chat_controller.dart';
import 'app/data/components/controllers/posts_controller.dart';
import 'app/modules/screens/Settings/controllers/controllers.dart';
import 'app/routes/app_pages.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyBPzO7GgpvzyGl8IFajZbLiDK_aXDylO7U",
      appId: "1:225398620061:web:01276b3a18b4e74b08b974",
      messagingSenderId: "225398620061",
      projectId: "sipmaa-ff120",
    ),
  );
   Get.put(ChatController());
  Get.put(HomeController());
  Get.put(SettingsController());
  Get.put(AuthController());
  Get.put(PostsController());
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
// home: HomePage(),
//  onGenerateRoute: AppPages.generateRoute,
//   initialRoute: TRoutes.HOME_PAGE,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
