import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  String? selectedValue;

  List<String> filter = <String>['All','Casual', 'Formal', 'Sports'];

  void dropdownFilter(String value) {
    selectedValue = value;
    notifyListeners();
  }
}
