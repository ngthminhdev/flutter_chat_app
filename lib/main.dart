import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mc_application/app_data.dart';
import 'package:mc_application/core/helpers/logger_helper.dart';
import 'package:mc_application/core/helpers/screen_helper.dart';
import 'package:mc_application/modules/authentication/login/login_page.dart';
import 'package:mc_application/modules/authentication/login/login_page_model.dart';
import 'package:mc_application/modules/authentication/signup/signup_page_model.dart';
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
  @override
  Widget build(BuildContext context) {
    //get screen info
    appData.heightScreen = screenHelper.getOriginHeight(context);
    appData.widthScreen = screenHelper.getOriginHeight(context);

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
