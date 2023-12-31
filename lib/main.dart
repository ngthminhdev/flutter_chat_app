import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mc_application/app_data.dart';
import 'package:mc_application/core/helpers/logger_helper.dart';
import 'package:mc_application/modules/authentication/login_page.dart';
import 'package:mc_application/modules/authentication/login_page_model.dart';
import 'package:mc_application/modules/authentication/signup_page_model.dart';
import 'package:mc_application/routes/router.dart' as main_router;
import 'package:provider/provider.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider<LoginPageModel>.value(value: LoginPageModel()),
      ChangeNotifierProvider<SignUpPageModel>.value(value: SignUpPageModel())
    ], child: MyApp()));
  }, (error, stack) {
    logger.log(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Social",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: 'Helvetica Neue',
          visualDensity: VisualDensity.adaptivePlatformDensity),
      navigatorKey: appData.navigatorKey,
      // initialRoute: RouteNames.login,
      onGenerateRoute: main_router.Router.generateRoute,
      home: LoginPage(),
    );
  }
}
