import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import 'package:shoeclub/infrastructure/cart/cart_services.dart';

class CartProvider extends ChangeNotifier {
  int totalPrice = 0;
  Future addToCart(
    Product product,
    String size,
    context,
  ) async {
    try {
      Response response =
          await CartApiCalls().addToCart(product, 1, size) as Response;
      await CartApiCalls().getCart();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            duration: const Duration(seconds: 1),
            backgroundColor: response.statusCode == 201
                ? Colors.green.shade400
                : Colors.red.shade400,
            content: response.statusCode == 201
                ? const Text('product added to cart successfully')
                : const Text('No product found')),
      );
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  void qtyChangeCart(Product product, String size, int qty) async {
    try {
      await CartApiCalls().addToCart(product, qty, size) as Response;
      await CartApiCalls().getCart();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  void removeFromCart(Product product, context) async {
    try {
      Response response =
          await CartApiCalls().removeFromCart(product) as Response;
      await CartApiCalls().getCart();
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text('Item removed from cart')),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
