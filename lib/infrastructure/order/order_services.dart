import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_address.dart';

import '../../core/core_datas.dart';

class OrdersApiCall {
  final dio = Dio();
  CoreDatas url = CoreDatas.internal();
  OrdersApiCall() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> orderCreate(OrderModal orderModal) async {
    log(orderModal.toJson().toString());
    try {
      Response response =
          await dio.post(url.ordersUrl, data: orderModal.toJson());
      log("1111111111111111111" + response.toString());
      return response;
    } on DioError catch (e) {
      log(e.response!.data);
    }
    return null;
  }
}
