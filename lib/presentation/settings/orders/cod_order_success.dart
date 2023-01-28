import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/presentation/settings/orders/screen_order_summary.dart';

class ScreenOrederSuccess extends StatelessWidget {
  const ScreenOrederSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScreenOrderSummary(
                  orders: Provider.of<OrderProvider>(context)
                      .orderDetails!
                      .orders!
                      .last,
                )))));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "asset/success.gif",
        ),
      ),
    );
  }
}
