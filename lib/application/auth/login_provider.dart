import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/user_modal/new_user.dart';
import 'package:shoeclub/infrastructure/auth/auth_services.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';

class LogInProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final signInEmailCOntroller = TextEditingController();
  final signInPasswordCOntroller = TextEditingController();
  Future<void> logInUser(
    BuildContext context,
  ) async {
    try {
      if (signInEmailCOntroller.text.isEmpty &&
          signInPasswordCOntroller.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please add all fields')),
        );
      } else if (formKey.currentState!.validate()) {
        final login = NewUser(
            email: signInEmailCOntroller.text,
            password: signInPasswordCOntroller.text);
        await AuthApiCall.instance.logIn(login);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SignIn SuccessFul')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => const BottomNavigationBarWidget()),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
