import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_checkout.dart';

import '../../presentation/cart/widgets/screen_address.dart';

class CheckoutProvider extends ChangeNotifier {
  final _razorpay = Razorpay();
  BuildContext? context;
  AddressElements? address;

  PaymentType? selectedPayment;

  void radioSelectPayments(PaymentType value) {
    selectedPayment = value;
    notifyListeners();
  }

  void payment(
    BuildContext context,
    AddressElements address,
  ) {
    final total = totalAmount.value;
    log(total.toString());
    var options = {
      "key": "rzp_test_dy3pJlhra0l9NF",
      "amount": total * 100,
      "name": "ShoeClub",
      "description": "Start Journey With Shoe Club",
      "prefill": {"contact": "8089466981", "email": "saheersaheer212@gmail.com"}
    };
    this.context = context;
    this.address = address;

    _razorpay.open(options);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handelePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handekePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handeleExternalWallet);

    notifyListeners();
  }

  void _handelePaymentSuccess(
    PaymentSuccessResponse response,
  ) {
    log("Payment Success+${response.paymentId}${response.orderId}${response.signature}");
    Provider.of<OrderProvider>(context!, listen: false).orderCreate(
        address!, PaymentType.ONLINE_PAYMENT, cartNotifierList.value, context);
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green.shade400,
          content: const Text('Payment Success')),
    );

    _razorpay.clear();
    notifyListeners();
  }

  void _handekePaymentError(PaymentFailureResponse response) {
    log("Payment Error+${response.code}${response.message}");
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.red.shade400,
          content: const Text('Payment Error')),
    );
    _razorpay.clear();
    notifyListeners();
  }

  void _handeleExternalWallet(ExternalWalletResponse response) {
    log("ExternalWallet+${response.walletName}");
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          duration: const Duration(seconds: 1),
          // backgroundColor: Colors.red.shade400,
          content: const Text('Payment Error')),
    );
    _razorpay.clear();
    notifyListeners();
  }
}
