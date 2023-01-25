import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
import 'package:shoeclub/infrastructure/order/order_services.dart';

import '../../presentation/cart/widgets/screen_address.dart';

class OrderProvider extends ChangeNotifier {
  Future<void> orderCreate(AddressElements addressElements, PaymentType type,
      List<ProductElementCart?> productElementOrder, context) async {
    try {
      final order = OrderModal(
          address: addressElements.address,
          fullName: addressElements.fullName,
          paymentType: type.toString(),
          phone: addressElements.phone,
          pin: addressElements.pin,
          place: addressElements.place,
          products: productElementOrder,
          state: addressElements.state,
          totalPrice: CoreDatas.instance.totalAmount.value,
          userid: CoreDatas.instance.userId,
          addressId: addressElements.id);
      Response response = await OrdersApiCall().orderCreate(order) as Response;
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text('Order placed successfully')),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
