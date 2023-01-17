import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/product_modal/product_modal.dart';

ValueNotifier<List<dynamic>> productListNotifier = ValueNotifier([]);

ValueNotifier<List<dynamic>> productCasualListNotifier = ValueNotifier([]);

ValueNotifier<List<dynamic>> productFormalListNotifier = ValueNotifier([]);

ValueNotifier<List<dynamic>> productSportsListNotifier = ValueNotifier([]);

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
        productCasualListNotifier.value.clear();
        productFormalListNotifier.value.clear();
        productSportsListNotifier.value.clear();
        for (var i = 0; i < productListNotifier.value.length; i++) {
          //Category casual
          if (productListNotifier.value[i]["category"] == "1") {
            productCasualListNotifier.value.add(productListNotifier.value[i]);
            productCasualListNotifier.notifyListeners();
            log("casual"+productCasualListNotifier.value.toString());
          } else if (productListNotifier.value[i]["category"] == "2") {
            //category Formal
            productFormalListNotifier.value.add(productListNotifier.value[i]);
            productFormalListNotifier.notifyListeners();
          } else {
            productSportsListNotifier.value.add(productListNotifier.value[i]);
            productSportsListNotifier.notifyListeners();
          }
        }
        return;
        log("-------------------" + productCasualListNotifier.value.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
