import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/modules/authentication/register/views/registerscreen.dart';
import 'package:reg_login/app/modules/screens/home/views/splash_view.dart';
import 'package:reg_login/app/responsive/responsive_homescreen.dart';
import 'package:reg_login/app/responsive/view/home_responsive_view.dart';
import 'package:reg_login/app/responsive/view/regiterform2_responsive.dart';
import 'package:reg_login/app/routes/app_pages.dart';

import '../modules/authentication/OTP/views/otp.dart';
import '../modules/authentication/forgotPassword/views/forgotpassword.dart';
import '../modules/authentication/register/views/register.dart';
import '../modules/authentication/register/views/registersplash.dart';
import '../modules/authentication/signin/views/signin.dart';
import '../modules/screens/Settings/views/settingss.dart';
import '../modules/screens/Settings/views/widgets/change_password.dart';
import '../modules/screens/profile/views/profile_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_PAGE:
        return _GeneratePageRoute(
            widget: HomeRespoView(), routeName: settings.name);

      case Routes.SPLASH:
        return _GeneratePageRoute(widget: Splash(), routeName: settings.name);

      case Routes.FORGOT_PASSWORD:
        return _GeneratePageRoute(
            widget: FORGOTPASSWORD(), routeName: settings.name);

    case Routes.responsive_registerDetails:
        return _GeneratePageRoute(
            widget: RegisterFormDetailsResponsive(), routeName: settings.name);

   case Routes.Resgister_2:
        return _GeneratePageRoute(
            widget: ResgisterDetailsWeb(), routeName: settings.name);


  case Routes.Resgister_Splash:
        return _GeneratePageRoute(
            widget: Registersplash(), routeName: settings.name);


  case Routes.Profile_Screen:
        return _GeneratePageRoute(
            widget: ps(), routeName: settings.name);




case Routes.Settings_page:
        return _GeneratePageRoute(
            widget:  SettingsPage(), routeName: settings.name);

case Routes.Change_password:
        return _GeneratePageRoute(
            widget:  demo(), routeName: settings.name);


      case Routes.OTP_VIEWS:
        return _GeneratePageRoute(
            widget: OTPVIEWS(
              phoneNumber: "",
              otp: "",
            ),
            routeName: settings.name);

      case Routes.SIGN_IN:
        return _GeneratePageRoute(
            widget: const HomeView(), routeName: settings.name);

      case Routes.RESP:
        return _GeneratePageRoute(widget: HomeView(), routeName: settings.name);

      case Routes.REGISTER_VIEWS:
        return _GeneratePageRoute(
            widget: const RegisterViews(), routeName: settings.name);

      default:
        return _GeneratePageRoute(widget: Splash(), routeName: settings.name);
    }
  }
} // Navigator.pushNamed(context, RoutesName.name);

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                key: UniqueKey(),
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(animation),
                child: child,
              );
            });
}
