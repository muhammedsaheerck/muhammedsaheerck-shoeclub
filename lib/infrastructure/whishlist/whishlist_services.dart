import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/domain/modal/whishlist/wishlist_modal.dart';

import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../core/url.dart';

class WhishlistApiCalls {
  final dio = Dio();

  WhishlistApiCalls() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> addAndRemoveWishlist(String id, String productId) async {
    log(productId.toString());
    try {
      Response response = await dio.post(baseUrl + whishListUrl,
          data: {"userId": id, "product": productId});
      log(response.statusCode.toString());
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future getWishlist(String? userId) async {
    try {
      Response response =
          await dio.get("${baseUrl + whishListUrl}?userId=$userId");
      Map<String, dynamic> data = await json.decode(response.data);
      log(response.data);
      if (response.statusCode == 200) {
        final getData = WishlistModal.fromJson(data);
        wishlistnotifier.value.clear();
        wishlistnotifier.value.addAll(getData.products!.reversed);
        wishlistnotifier.notifyListeners();
        log(getData.products.toString());
        log("wish" + wishlistnotifier.value.toString());
        // log(wishlistnotifier.value[0]["product"]["image"][0].toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
