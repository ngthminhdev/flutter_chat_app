import 'package:flutter/material.dart';
import 'package:mc_application/modules/authentication/login/login_page.dart';
import 'package:mc_application/modules/authentication/signup/signup_page.dart';

class RouteNames {
  static const String home = 'Home';
  static const String login = 'Login';
  static const String signUp = 'SignUp';
}

class RouteCreator {
  static Map<String, BaseRoute> routes = {
    //authentication
    RouteNames.login: BaseRoute(RouteNames.login, 'Login', null,
        view: ({settings}) => LoginPage()),
    RouteNames.signUp: BaseRoute(RouteNames.signUp, 'SignUp', null,
        view: ({settings}) => SignUpPage())
  };
}

class BaseRoute {
  final IconData? icon;
  final String routeName;
  final String routeTitle;
  final Widget? Function({RouteSettings? settings})? view;

  BaseRoute(this.routeName, this.routeTitle, this.icon, {this.view});
}

BaseRoute? Function(String?) getRoute = (String? routeName) {
  return RouteCreator.routes[routeName];
};
