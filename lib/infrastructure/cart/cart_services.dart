import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';

import '../../core/url.dart';

class CartApiCalls {
  final dio = Dio();

  CartApiCalls.internal();
  static CartApiCalls instance = CartApiCalls.internal();
  CartApiCalls factory() {
    return instance;
  }

  CartApiCalls() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> addToCart(Product product, int? qty, String? size) async {
    log(qty.toString());
    try {
      Response response = await dio.post(baseUrl + cartUrl, data: {
        "userid": userId,
        "product": product.id,
        "qty": qty,
        "size": size
      });
      log(response.statusCode.toString());
      log(response.toString());

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> getCart() async {
    try {
      Response response = await dio.get("${baseUrl + cartUrl}?userid=$userId");
      Map<String, dynamic> data = await json.decode(response.data);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final getData = CartModal.fromJson(data);
        totalPrice.value = getData.totalPrice!;
        totalPrice.notifyListeners();
        cartNotifierList.value.clear();
        cartNotifierList.value.addAll(getData.products!.reversed);
        cartNotifierList.notifyListeners();

        log("cart" + cartNotifierList.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> removeFromCart(Product product) async {
    try {
      Response response = await dio.patch(baseUrl + cartUrl,
          data: {"product": product.id, "userid": userId});

      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
