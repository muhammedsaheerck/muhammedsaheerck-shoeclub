import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/const_datas.dart';
import '../../infrastructure/product/product_services.dart';

class HomeProvider extends ChangeNotifier {
  int selectedValue = 0;
  // List<Product?> valueFound = [];

  // List<String> filter = <String>['All', 'Casual', 'Formal', 'Sports'];

  void dropdownFilter(int value) {
    selectedValue = value;
    notifyListeners();
  }

  void dropdownShowProducts(int value) {
    if (value == 0) {
      valueFound.value = productListNotifier.value;
      valueFound.notifyListeners();
      log("casualaaa" + valueFound.toString());
    } else if (value == 1) {
      valueFound.value = productCasualListNotifier.value;
      valueFound.notifyListeners();
      log("+++++++++" + valueFound.toString());
    } else if (value == 2) {
      valueFound.value = productFormalListNotifier.value;
      valueFound.notifyListeners();
    } else {
      valueFound.value = productSportsListNotifier.value;
      valueFound.notifyListeners();
    }
    notifyListeners();
  }
}
