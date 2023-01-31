import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
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
      return response;
    } on DioError catch (e) {
      log(e.response!.data);
    }

    return null;
  }

  Future<void> getAllOrders(context) async {
    try {
      Response response =
          await dio.get("${url.ordersUrl}?userid=${url.userId}");
      log("getorders---response---------- ${response.toString()}");
      Map<String, dynamic> data = await json.decode(response.data);
      final getdata = OrderModal.fromJson(data);
      log("Converted REsponse order ${getdata.toJson().toString()}");
      Provider.of<OrderProvider>(context, listen: false).getOrders(getdata);
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  Future<Response?> orderDelete(String id) async {
    try {
      Response response = await dio.patch("${url.ordersUrl}$id");
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
