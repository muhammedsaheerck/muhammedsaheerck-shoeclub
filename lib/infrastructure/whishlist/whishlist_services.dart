import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/domain/modal/product_modal/product_modal.dart';

import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../core/url.dart';

class WhishlistApiCalls {
  final dio = Dio();

  WhishlistApiCalls() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }

  Future<void> addAndRemoveWishlist(dynamic userid, dynamic product) async {
    try {
      Response response = await dio.post(baseUrl + whishListUrl,
          data: {"userId": userid, "product": product});
      log(response.statusCode.toString());
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getWishlist() async {
    try {
      Response response = await dio.get(baseUrl + whishListUrl);
      log(response.data);
      if (response.statusCode == 200) {
        final getData = Product.fromJson(jsonDecode(response.data));
        wishlistnotifier.value.clear();
        wishlistnotifier.value.addAll(getData.products.reversed);
        wishlistnotifier.notifyListeners();
        log(wishlistnotifier.value[0].toString());
        log(wishlistnotifier.value[0]["product"]["image"][0].toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
