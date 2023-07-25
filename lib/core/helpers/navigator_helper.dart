import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mc_application/routes/route_config.dart' as route_config;

class NavigatorHelper {
  static final NavigatorHelper _navigatorHelper = NavigatorHelper._internal();
  void changeView(BuildContext context, String routeName,
      {bool isReplaceName = false, Object? arguments}) {
    final route = route_config.getRoute(routeName);
    final Widget view = route!.view!.call(settings: null);

    if (isReplaceName) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: view,
        ),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: view,
        ),
      );
    }
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
