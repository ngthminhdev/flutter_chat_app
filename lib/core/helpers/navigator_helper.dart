import 'package:flutter/material.dart';

class NavigatorHelper {
  static final NavigatorHelper _navigatorHelper = NavigatorHelper._internal();

  changeView(context, routeName, {isReplaceName = false, arguments}) {
    return isReplaceName
        ? Navigator.pushReplacementNamed(context, routeName,
            arguments: arguments)
        : Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  popView(context, data) {
    return Navigator.pop(context, data);
  }

  factory NavigatorHelper() {
    return _navigatorHelper;
  }
  NavigatorHelper._internal();
}

final navigatorHelper = NavigatorHelper();
