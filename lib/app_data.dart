import 'package:flutter/material.dart';

class AppData {
  static final AppData _app = AppData._internal();

  String env = '';
  int? version = 0;
  String apiHost = '';
  String? apiVersion = '';
  String apiUrl = '';
  String? dbName = '';

  double widthScreen = 0;
  double heightScreen = 0;

  String deviceInfo = '';
  int os = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory AppData() {
    return _app;
  }
  AppData._internal();
}

final appData = AppData();
