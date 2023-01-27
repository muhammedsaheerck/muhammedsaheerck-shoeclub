import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
import 'package:shoeclub/infrastructure/order/order_services.dart';
import 'package:shoeclub/presentation/settings/widgets/screen_myorders.dart';

import '../../presentation/cart/widgets/screen_address.dart';

class OrderProvider extends ChangeNotifier {
  OrderModal? orderDetails;

  getOrders(OrderModal orderModal) {
    orderDetails = orderModal;
    notifyListeners();
  }

  Future<void> orderCreate(AddressElements addressElements, PaymentType type,
      List<ProductElementCart?> productElementOrder, context) async {
    try {
      final order = Orders(
          address: addressElements.address,
          fullName: addressElements.fullName,
          paymentType: type.name.toUpperCase(),
          phone: addressElements.phone,
          pin: addressElements.pin,
          place: addressElements.place,
          products: productElementOrder,
          state: addressElements.state,
          totalPrice: CoreDatas.instance.totalAmount.value,
          userid: CoreDatas.instance.userId,
          addressId: addressElements.id);
      Response response =
          await OrdersApiCall().orderCreateService(order) as Response;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenMyOrders(),
      ));
      log("ooooooooooooooo" + response.toString());
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.green.shade400,
              content: const Text('Order placed successfully')),
        );
        // await OrdersApiCall().getAllOrders(context);
      }
    } catch (e) {
      log("orderprovider" + e.toString());
    }
    notifyListeners();
  }

  Future<void> cancelOrder(String orderid, context) async {
    try {
      Response response = await OrdersApiCall().orderDelete(
        orderid,
      ) as Response;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            duration: const Duration(seconds: 1),
            backgroundColor: response.statusCode == 200
                ? Colors.green.shade400
                : Colors.red.shade400,
            content: response.statusCode == 200
                ? const Text('order canceled successfullly')
                : const Text('order already canceled ')),
      );
    } on DioError catch (e) {
      log(e.response!.data);
    }
    notifyListeners();
  }
}
