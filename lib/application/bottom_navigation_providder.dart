import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int selectedIndex = 0;
  void tabBarChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
