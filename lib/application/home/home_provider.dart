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

  void dropdownShowProducts(String value) {
    if (value == "All") {
      valueFound.value = productListNotifier.value;
      valueFound.notifyListeners();
      log(valueFound.toString());
    } else if (value == "Casual") {
      valueFound.value = productCasualListNotifier.value;
      valueFound.notifyListeners();
      log(valueFound.toString());
    } else if (value == "Formal") {
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
    valueFound.value = resluts;
    notifyListeners();
  }

//size selecting
  String selectedSize = "6";
  void selectSize(String size) {
    selectedSize = size;
    log(selectedSize.toString());
    notifyListeners();
  }

//image change a product
  int selectedImageValue = 0;

  void selectedImage(int value) {
    selectedImageValue = value;
    notifyListeners();
  }

//bottom NavigationBar
  int selectedIndex = 0;
  void tabBarChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
