import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import '../../core/const_datas.dart';
import '../../domain/modal/cart/cart_modal.dart';
import '../../infrastructure/product/product_services.dart';

class HomeProvider extends ChangeNotifier {
  String? selectedValue = "All";
  // List<Product?> valueFound = [];

  // List<String> filter = <String>['All', 'Casual', 'Formal', 'Sports'];

  void dropdownFilter(String value) {
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

  bool? searchIdForCart(Product product) {
    bool findVCarttId = false;
    for (var i = 0; i < cartNotifierList.value.length; i++) {
      if (cartNotifierList.value[i]!.product!.id == product.id) {
        findVCarttId = true;
      }
    }
    return findVCarttId;
  }
}
