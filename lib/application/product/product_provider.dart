import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  int selectedValue = 0;

  void selectedImage(int value) {
    selectedValue = value;
    notifyListeners();
  }
}
