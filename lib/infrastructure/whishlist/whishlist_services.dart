import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shoeclub/domain/modal/whishlist/wishlist_modal.dart';
import '../../core/core_datas.dart';

class WhishlistApiCalls {
  final dio = Dio();
  CoreDatas url = CoreDatas.internal();
  WhishlistApiCalls() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> addAndRemoveWishlist(String id, String productId) async {
    log(productId.toString());
    try {
      Response response = await dio.post(url.baseUrl + url.whishListUrl,
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
          await dio.get("${url.baseUrl + url.whishListUrl}?userId=$userId");
      Map<String, dynamic> data = await json.decode(response.data);
      log(response.data);
      if (response.statusCode == 200) {
        final getData = WishlistModal.fromJson(data);
        wishlistnotifier.value.clear();
        wishlistnotifier.value.addAll(getData.products!.reversed);
        wishlistnotifier.notifyListeners();
        log(getData.products.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
