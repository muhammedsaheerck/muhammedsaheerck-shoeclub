import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/domain/modal/user/new_user.dart';
import 'package:shoeclub/infrastructure/auth/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  String? nameUser;
  bool passVisibility = true;
  void obsecureChange(bool value) {
    passVisibility = value;
    notifyListeners();
  }

  // Future<void> userAlreadySigned(String email) async {
  //   try {
  //     final data = await AuthApiCall().userAlreadySigned(email);
  //     userDetail = data;
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   notifyListeners();
  // }

}
