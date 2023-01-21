import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool passVisibility = true;
  void obsecureChange(bool value) {
    passVisibility = value;
    notifyListeners();
  }
}
