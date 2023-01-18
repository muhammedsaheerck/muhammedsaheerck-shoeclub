import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/user/new_user.dart';
import 'package:shoeclub/infrastructure/auth/auth_services.dart';

import '../../presentation/login/screen_login.dart';

class ForgotPassWord extends ChangeNotifier {
  final forgotEmailCOntroller = TextEditingController();
  final forgotPasswordCOntroller = TextEditingController();
  final forgotConfirmPasswordCOntroller = TextEditingController();

  Future<void> changePassword(context, key) async {
    log("message");
    try {
      if (forgotEmailCOntroller.text.isEmpty &&
          forgotPasswordCOntroller.text.isEmpty &&
          forgotConfirmPasswordCOntroller.text !=
              forgotPasswordCOntroller.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')),
        );
      } else {
        if (key.currentState!.validate()) {
          final changePass = NewUser(
              email: forgotEmailCOntroller.text,
              password: forgotPasswordCOntroller.text);

          await AuthApiCall.instance.forgotPassWord(changePass);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Changed Successfully')),
          );
          Navigator.of(context).pop();
          forgotConfirmPasswordCOntroller.clear();
          forgotEmailCOntroller.clear();
          forgotPasswordCOntroller.clear();
        }
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
