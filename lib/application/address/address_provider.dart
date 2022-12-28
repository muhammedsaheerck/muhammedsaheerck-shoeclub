import 'package:flutter/foundation.dart';

class AddressProvider extends ChangeNotifier {
  bool check = false;
  void checkBoxChange(bool value) {
    check = value;
    notifyListeners();
  }
}
