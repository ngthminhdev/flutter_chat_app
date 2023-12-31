import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mc_application/core/appearances/colors.dart';
import 'package:mc_application/core/bases/base_mixin_model.dart';
import 'package:mc_application/core/widgets/loading/loading_widget.dart';
import 'package:mc_application/modules/authentication/login_page_model.dart';
import 'package:mc_application/modules/authentication/methods.dart';
import 'package:mc_application/modules/authentication/widgets/login_button_widget.dart';
import 'package:mc_application/modules/authentication/widgets/password_input_widget.dart';
import 'package:mc_application/modules/authentication/widgets/switch_widget.dart';
import 'package:mc_application/modules/authentication/widgets/username_input_widget.dart';
import 'package:mc_application/resources/modal_progress_hud.dart';
import 'package:need_resume/need_resume.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ResumableState<LoginPage>
    with MixinModel<LoginPageModel> {
  LoginPageModel loginPageModel = LoginPageModel();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void onReady() {
  //   logger.log('Login page is ready');
  // }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext ctx, LoginPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, LoginPageModel model, Widget? child) {
      return ModalProgressHUD(
          child: buildBody(context),
          progressIndicator: Loading(),
          inAsyncCall: loginPageModel.busy);
    };
  }

  @override
  LoginPageModel withModel() {
    return loginPageModel;
  }

  buildBody(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppName(),
                  const SizedBox(height: 40),
                  buildPassport(),
                  const SizedBox(height: 20),
                  const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  UserNameInputWidget(loginPageModel),
                  const SizedBox(height: 20),
                  PasswordInputWidget(loginPageModel),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SwitchButton(loginPageModel),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  LoginButton(loginPageModel),
                  const SizedBox(height: 40),
                  Center(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Forgot your password?',
                        style: const TextStyle(
                            color: primaryGreen, fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('click to forget password');
                          },
                      ),
                    ])),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                        text: 'Don\'t? have a account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign up now!',
                        style: const TextStyle(
                            color: primaryGreen, fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            loginPageModel.moveToSignUp(context);
                          },
                      ),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginPageModel.dispose();
    super.dispose();
  }
}
