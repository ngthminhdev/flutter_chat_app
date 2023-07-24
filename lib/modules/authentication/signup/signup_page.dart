import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mc_application/core/appearances/colors.dart';
import 'package:mc_application/core/bases/base_mixin_model.dart';
import 'package:mc_application/core/widgets/loading/loading_widget.dart';
import 'package:mc_application/modules/authentication/methods.dart';
import 'package:mc_application/modules/authentication/signup/password_input_widget.dart';
import 'package:mc_application/modules/authentication/signup/signup_button_widget.dart';
import 'package:mc_application/modules/authentication/signup/signup_page_model.dart';
import 'package:mc_application/modules/authentication/signup/username_input_widget.dart';
import 'package:mc_application/resources/modal_progress_hud.dart';
import 'package:need_resume/need_resume.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ResumableState<SignUpPage>
    with MixinModel<SignUpPageModel> {
  SignUpPageModel signUpPageModel = SignUpPageModel();

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext ctx, SignUpPageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, SignUpPageModel model, Widget? child) {
      return ModalProgressHUD(
          child: buildBody(context),
          progressIndicator: const Loading(),
          inAsyncCall: signUpPageModel.busy);
    };
  }

  @override
  SignUpPageModel withModel() {
    return signUpPageModel;
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  UserNameInputWidget(signUpPageModel),
                  const SizedBox(height: 20),
                  PasswordInputWidget(signUpPageModel),
                  const SizedBox(height: 80),
                  SignUpButton(signUpPageModel),
                  const SizedBox(height: 100),
                  Center(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                        text: 'Have a account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Log in now!',
                        style: const TextStyle(
                            color: primaryGreen, fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            signUpPageModel.moveToLogIn(context);
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
    signUpPageModel.dispose();
    super.dispose();
  }
}
