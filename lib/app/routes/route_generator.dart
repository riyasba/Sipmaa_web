
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:reg_login/app/modules/authentication/OTP/views/otp.dart';
// import 'package:reg_login/app/modules/authentication/forgotPassword/views/forgotpassword.dart';
// import 'package:reg_login/app/modules/authentication/register/views/register.dart';
// import 'package:reg_login/app/modules/authentication/register/views/registerscreen.dart';
// import 'package:reg_login/app/modules/authentication/register/views/registersplash.dart';
// import 'package:reg_login/app/modules/authentication/signin/views/signin.dart';
// import 'package:reg_login/app/modules/screens/Settings/views/settingss.dart';
// import 'package:reg_login/app/modules/screens/Settings/views/widgets/change_password.dart';
// import 'package:reg_login/app/modules/screens/home/views/home_screen.dart';
// import 'package:reg_login/app/modules/screens/profile/views/profile_page.dart';
// import 'package:reg_login/app/routes/app_pages.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.SIGN_IN:
//         return _GeneratePageRoute(
//             widget: SignInView(), routeName: settings.name);
//       case Routes.FORGOT_PASSWORD:
//         return _GeneratePageRoute(
//             widget: FORGOTPASSWORD(), routeName: settings.name);
//       case Routes.REGISTER_VIEWS:
//         return _GeneratePageRoute(
//             widget: RegisterViews(), routeName: settings.name);
//       case Routes.OTP_VIEWS:
//         return _GeneratePageRoute(
//             widget: OTPVIEWS(), routeName: settings.name);
//       case Routes.Resgister_2:
//         return _GeneratePageRoute(
//             widget: Resgister2(), routeName: settings.name);
//       case Routes.Resgister_Splash:
//         return _GeneratePageRoute(
//             widget: Registersplash(), routeName: settings.name);
//       case Routes.HOME_PAGE:
//         return _GeneratePageRoute(
//             widget: HomePage(), routeName: settings.name);
//       case Routes.Profile_Screen:
//         return _GeneratePageRoute(
//             widget: ps(), routeName: settings.name);
//       case Routes.Settings_page:
//         return _GeneratePageRoute(
//             widget: SettingsPage(), routeName: settings.name);
//       case Routes.Change_password:
//         return _GeneratePageRoute(
//             widget: demo(), routeName: settings.name);
//             default:
        
       
//           return _GeneratePageRoute(
//               widget: HomeScreen(), routeName: settings.name);
        
    
//     }
//   }
// } // Navigator.pushNamed(context, RoutesName.name);

// class _GeneratePageRoute extends PageRouteBuilder {
//   final Widget widget;
//   final String? routeName;
//   _GeneratePageRoute({required this.widget, required this.routeName})
//       : super(
//             settings: RouteSettings(name: routeName),
//             pageBuilder: (BuildContext context, Animation<double> animation,
//                 Animation<double> secondaryAnimation) {
//               return widget;
//             },
//             transitionDuration: Duration(milliseconds: 400),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return FadeTransition(
//                 key: UniqueKey(),
//                 opacity: Tween<double>(
//                   begin: 0.0,
//                   end: 1.0,
//                 ).animate(animation),
//                 child: child,
//               );
//             });
// }
