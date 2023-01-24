import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/core_datas.dart';
import '../../domain/modal/product/product_modal.dart';
import '../../infrastructure/whishlist/whishlist_services.dart';

class WhishListProvider extends ChangeNotifier {
  void userIdGet(String id) {
    CoreDatas.instance.userId = id;
    log(CoreDatas.instance.userId.toString());
    notifyListeners();
  }

  bool? searchIdForWishlist(Product product) {
    bool findProductId = false;
    for (var i = 0; i < CoreDatas.instance.wishlistnotifier.value.length; i++) {
      if (CoreDatas.instance.wishlistnotifier.value[i]!.product!.id ==
          product.id) {
        findProductId = true;
      }
    }
    return findProductId;
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
}
