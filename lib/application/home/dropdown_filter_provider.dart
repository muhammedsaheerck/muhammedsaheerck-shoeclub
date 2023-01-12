import 'package:flutter/cupertino.dart';

class DropdownFilterProvider extends ChangeNotifier {
  String? selectedValue;
  List<String> filter = <String>['Casual', 'Formal','Sports'];

  void dropdownFilter(String value) {
    selectedValue = value;
    notifyListeners();
  }
}
