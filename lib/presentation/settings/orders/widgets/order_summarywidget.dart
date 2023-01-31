import 'package:flutter/material.dart';

import '../../../../core/core_datas.dart';

class OrderSummaryWidgetNames extends StatelessWidget {
  const OrderSummaryWidgetNames({
    super.key,
    required this.core,
  });

  final CoreDatas core;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        core.height10,
        const Text(
          "OrderStatus :",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        const Text(
          "paymentType",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        const Text(
          "paymentStatus",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        const Text(
          "OrderDate",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        const Text(
          "deliveryDate",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        core.divider1,
        const Text(
          "Delivery Fee ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        const Text(
          "Total Price ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        core.height10,
        core.divider1,
      ],
    );
  }
}
