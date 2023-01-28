import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import '../../core/core_datas.dart';
import '../../infrastructure/product/product_services.dart';

class HomeProvider extends ChangeNotifier {
  CoreDatas core = CoreDatas.internal();
  List<String> filter = <String>['All', 'Casual', 'Formal', 'Sports'];
  String? selectedValue = "All";
  final searchController = TextEditingController();
  // List<Product> matchQuery = [];
  bool datawait = false;

  void dropdownFilter(String value) {
    selectedValue = value;
    notifyListeners();
  }

  // void dataWaitCircle(bool value) {
  //   datawait = value;
  //   notifyListeners();
  // }

  void dropdownShowProducts(String value) {
    if (value == "All") {
      CoreDatas.instance.valueFound.value = productListNotifier.value;
      CoreDatas.instance.valueFound.notifyListeners();
      log("casualaaa" + CoreDatas.instance.valueFound.toString());
    } else if (value == "Casual") {
      CoreDatas.instance.valueFound.value = productCasualListNotifier.value;
      CoreDatas.instance.valueFound.notifyListeners();
      log("+++++++++" + CoreDatas.instance.valueFound.toString());
    } else if (value == "Formal") {
      CoreDatas.instance.valueFound.value = productFormalListNotifier.value;
      CoreDatas.instance.valueFound.notifyListeners();
    } else {
      CoreDatas.instance.valueFound.value = productSportsListNotifier.value;
      CoreDatas.instance.valueFound.notifyListeners();
    }
    notifyListeners();
  }

  bool? searchIdForCart(Product product) {
    bool findVCarttId = false;
    for (var i = 0; i < CoreDatas.instance.cartNotifierList.value.length; i++) {
      if (CoreDatas.instance.cartNotifierList.value[i]!.product!.id ==
          product.id) {
        findVCarttId = true;
      }
    }
    return findVCarttId;
  }

//PRoduct Search
  void searchaProduct(String enteredKeyword) {
    List<Product?> resluts = [];
    if (enteredKeyword.isEmpty) {
      resluts = productListNotifier.value;
    } else {
      resluts = productListNotifier.value
          .where((user) =>
              user!.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    CoreDatas.instance.valueFound.value = resluts;
    notifyListeners();
  }
}
