import 'package:flutter/material.dart';
import 'package:mc_application/core/bases/base_page_model.dart';

class SignUpPageModel extends BasePageModel {
  bool obscureText = true;
  bool switchValue = false;

  TextEditingController userName = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  BuildContext? context;

  bool isValidPassword() {
    return true;
  }

  void rememberMe(bool newValue) {
    switchValue = newValue;
    notifyListeners();
    //logic save to local storage
  }

  void showPassword() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void moveToForgetPassword() {}

  void moveToSignUp() {}

  login(BuildContext context) {
    userNameFocus.unfocus();
    passwordFocus.unfocus();

    if (busy) {
      return;
    }

    print(userName.toString());
    print(password.toString());
  }
}
