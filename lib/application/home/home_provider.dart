import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import 'package:shoeclub/infrastructure/whishlist/whishlist_services.dart';

import '../../infrastructure/product/product_services.dart';
import '../../presentation/home/screen_home.dart';

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
      log("casualaaa" + valueFound.toString());
    } else if (value == 1) {
      valueFound.value = productCasualListNotifier.value;
      log("+++++++++" + valueFound.toString());
    } else if (value == 2) {
      valueFound.value = productFormalListNotifier.value;
    } else {
      valueFound.value = productSportsListNotifier.value;
    }
    notifyListeners();
  }

 
}
