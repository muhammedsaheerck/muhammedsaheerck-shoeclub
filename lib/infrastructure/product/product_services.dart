import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import '../../core/core_datas.dart';

ValueNotifier<List<Product?>> productListNotifier = ValueNotifier([]);
ValueNotifier<List<Product?>> productCasualListNotifier = ValueNotifier([]);
ValueNotifier<List<Product?>> productFormalListNotifier = ValueNotifier([]);
ValueNotifier<List<Product?>> productSportsListNotifier = ValueNotifier([]);

class ProductApiCalls {
  final dio = Dio();
  CoreDatas url = CoreDatas.internal();
  ProductApiCalls() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  Future getProducts(context) async {
    try {
      Response response = await dio.get(url.baseUrl + url.productUrl);
      Map<String, dynamic> data = await json.decode(response.data);
      log(response.data);

      if (response.statusCode == 200) {
        final getData = ProductModal.fromJson(data);
        productListNotifier.value.clear();
        productListNotifier.value.addAll(getData.products!.reversed);
        productListNotifier.notifyListeners();
        log(productListNotifier.value.toString());
        productCasualListNotifier.value.clear();
        productFormalListNotifier.value.clear();
        productSportsListNotifier.value.clear();
        for (var i = 0; i < productListNotifier.value.length; i++) {
          //Category casual
          if (productListNotifier.value[i]!.category == "1") {
            productCasualListNotifier.value.add(productListNotifier.value[i]);
            productCasualListNotifier.notifyListeners();
          } else if (productListNotifier.value[i]!.category == "2") {
            //category Formal
            productFormalListNotifier.value.add(productListNotifier.value[i]);
            productFormalListNotifier.notifyListeners();
          } else {
            productSportsListNotifier.value.add(productListNotifier.value[i]);
            productSportsListNotifier.notifyListeners();
          }
        }
        return;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
