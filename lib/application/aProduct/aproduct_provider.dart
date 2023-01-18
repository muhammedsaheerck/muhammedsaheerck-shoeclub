import 'dart:developer';

import 'package:flutter/cupertino.dart';

class AProductProvider extends ChangeNotifier {
  String selectedSize = "6";

  void selectSize(String size) {
    selectedSize = size;
    log(selectedSize.toString());
    notifyListeners();
  }
}
