import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
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

  Future<Response?> orderCreateService(Orders orderModal) async {
    log(orderModal.toJson().toString());
    try {
      Response response =
          await dio.post(url.ordersUrl, data: orderModal.toJson());

      log("1111111111111111111" + response.toString());
      return response;
    } on DioError catch (e) {
      log("orderrrrr" + e.response!.data);
    }

    return null;
  }

  Future<void> getAllOrders(context) async {
    try {
      log("" + CoreDatas.instance.userId.toString());
      Response response = await dio.get(url.ordersUrl);
      Map<String, dynamic> data = await json.decode(response.data);
      final getdata = Orders.fromJson(data);
      log(getdata.toJson().toString());
      Provider.of<OrderProvider>(context, listen: false).getOrders(getdata);
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }
}
