import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reg_login/app/modules/authentication/register/views/registerscreen.dart';
import 'package:reg_login/app/modules/screens/home/views/splash_view.dart';
import 'package:reg_login/app/responsive/responsive_homescreen.dart';
import 'package:reg_login/app/responsive/view/home_respo.dart';
import 'package:reg_login/app/responsive/view/home_responsive_view.dart';
import 'package:reg_login/app/routes/app_pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_PAGE:
        return _GeneratePageRoute(
            widget: HomeRespoView(), routeName: settings.name);

      case Routes.SPLASH:
        return _GeneratePageRoute(widget: Splash(), routeName: settings.name);

      case Routes.SIGN_IN:
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
