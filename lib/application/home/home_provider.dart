import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product_modal/product_modal.dart';
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

  Future addTOWishlist(String userId, String productId, context) async {
    try {
      Response? response =
          await WhishlistApiCalls().addAndRemoveWishlist(userId, productId);
      await WhishlistApiCalls().getWishlist(userId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            duration: const Duration(seconds: 1),
            backgroundColor: response!.statusCode == 201
                ? Colors.green.shade400
                : Colors.red.shade400,
            content: response.statusCode == 201
                ? const Text('product added to wishlist')
                : const Text('product removed from wishlist')),
      );
    } catch (e) {
      log(e.toString());
    }
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

  bool? searchIdForWishlist(Product product) {
    bool findProductId = false;
    for (var i = 0; i < wishlistnotifier.value.length; i++) {
      if (wishlistnotifier.value[i]!.product!.id == product.id) {
        findProductId = true;
      }
    }
    return findProductId;
  }
}
