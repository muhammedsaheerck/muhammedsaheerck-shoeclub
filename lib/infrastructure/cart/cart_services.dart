import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';

import '../../core/core_datas.dart';

class CartApiCalls {
  final dio = Dio();
  CoreDatas url = CoreDatas.internal();

  CartApiCalls.internal();
  static CartApiCalls instance = CartApiCalls.internal();
  CartApiCalls factory() {
    return instance;
  }

  CartApiCalls() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> addToCart(Product product, int? qty, String? size) async {
    log(qty.toString());
    try {
      log("userId cartServu" + CoreDatas.instance.userId.toString());
      Response response = await dio.post(url.baseUrl + url.cartUrl, data: {
        "userid": CoreDatas.instance.userId,
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

  Future<CartModal?> getCart() async {
    try {
      Response response = await dio.get(
          "${url.baseUrl + url.cartUrl}?userid=${CoreDatas.instance.userId}");
      Map<String, dynamic> data = await json.decode(response.data);
      log(response.statusCode.toString());

      final getData = CartModal.fromJson(data);

      log("cart" + CoreDatas.instance.cartNotifierList.toString());
      return getData;
    } on DioError catch (e) {
      log("carttt---------" + e.response!.data);
      log(CoreDatas.instance.cartNotifierList.toString());
    } catch (e) {
      CoreDatas.instance.cartNotifierList.value.clear();
      CoreDatas.instance.cartNotifierList.notifyListeners();
    }
    return null;
  }

  Future<Response?> removeFromCart(Product product) async {
    try {
      Response response = await dio.patch(url.baseUrl + url.cartUrl,
          data: {"product": product.id, "userid": CoreDatas.instance.userId});

      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
