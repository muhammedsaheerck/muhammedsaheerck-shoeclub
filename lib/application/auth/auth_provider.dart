import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/modal/user/new_user.dart';
import '../../infrastructure/auth/auth_services.dart';
import '../../presentation/signup/widgets/screen_otp.dart';

class AuthProvider extends ChangeNotifier {
/*LOGIN SECTION*/

  final signInEmailCOntroller = TextEditingController();
  final signInPasswordCOntroller = TextEditingController();
  String? nameUser;
  bool passVisibility = true;
//password visibility login
  void obsecureChange(bool value) {
    passVisibility = value;
    notifyListeners();
  }

//login user
  Future<void> logInUser(context, GlobalKey<FormState> formkey) async {
    if (signInEmailCOntroller.text.isEmpty &&
        signInPasswordCOntroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.red.shade400,
            content: const Text('Please add all fields')),
      );
    } else if (formkey.currentState!.validate()) {
      try {
        final login = NewUser(
            email: signInEmailCOntroller.text,
            password: signInPasswordCOntroller.text);
        await AuthApiCall().logIn(login, context);
        signInEmailCOntroller.clear();
        signInPasswordCOntroller.clear();
      } catch (e) {
        log(e.toString());
      }
    }
  }

//SIGNUP SECTION
  final signupNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();

  Future signUpUser(context) async {
    try {
      log(signupNameController.text);
      log(signupEmailController.text);
      log(signupPasswordController.text);
      log(signupConfirmPasswordController.text);
      if (signupNameController.text.isEmpty &&
          signupEmailController.text.isEmpty &&
          signupPasswordController.text.isEmpty &&
          signupConfirmPasswordController.text.isEmpty &&
          signupPasswordController.text !=
              signupConfirmPasswordController.text) {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text('Please add all fields')),
        );
      } else {
        AuthApiCall().sendOtp(signupEmailController.text);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => ScreenOtp(
                  email: signupEmailController.text,
                  pass: signupPasswordController.text,
                  name: signupNameController.text,
                )),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
