import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/product_modal/product_modal.dart';
ValueNotifier<List<dynamic>> productListNotifier = ValueNotifier([]);
class ProductApiCalls {
  

  final dio = Dio();

  ProductApiCalls() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }

  Future getProducts() async {
    try {
      Response response = await dio.get(baseUrl + productUrl);
      log(response.data);
      if (response.statusCode == 200) {
        final getData = Product.fromJson(jsonDecode(response.data));
        productListNotifier.value.clear();
        productListNotifier.value.addAll(getData.products.reversed);
        productListNotifier.notifyListeners();
        log(productListNotifier.value.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
