import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
import 'package:shoeclub/presentation/settings/orders/screen_myorders.dart';
import 'package:shoeclub/presentation/widgets/appbar_customWidget.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';
import '../../../core/core_datas.dart';
import 'widgets/order_summarywidget.dart';

class ScreenOrderSummary extends StatelessWidget {
  final Orders orders;
  const ScreenOrderSummary({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final core = CoreDatas.internal();
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarCustomWidget(
              appBarName: "PACKAGE SUMMARY",
            )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset("asset/order-summary.png")),
              core.height30,
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: OrderSummaryWidgetNames(core: core),
                  ),
                  orderSummaryDetailsMethod(core)
                ],
              ),
              const Text(
                "Product at : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              core.height10,
              const Text(
                "Shoeclubs warehouse ",
                style: TextStyle(fontSize: 20),
              ),
              core.height10,
              core.divider1,
              const Text(
                "Deliverd at : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              core.height10,
              Text(
                orders.fullName!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                orders.phone!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                orders.address!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                orders.place!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                orders.state!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                orders.pin!,
                style: const TextStyle(fontSize: 20),
              ),
              core.height30,
              ElevatedButton(
                  style: CoreDatas.instance.buttonStyle,
                  onPressed: (() async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) =>
                            const BottomNavigationBarWidget()),
                      ),
                    );
                  }),
                  child: const Text(
                    "CONTINUE SHOPING",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Flexible orderSummaryDetailsMethod(CoreDatas core) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        core.height10,
        Text(
          orders.orderStatus!,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
        core.height10,
        Text(
          orders.paymentType!,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
        core.height10,
        Text(
          orders.paymentType == "COD" ? "Pending" : "Paid",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
        core.height10,
        Consumer<OrderProvider>(
          builder: (context, value, child) => Text(
            value.parseDate(orders.orderDate!),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        core.height10,
        Consumer<OrderProvider>(
          builder: (context, value, child) => Text(
            value.parseDate(orders.deliveryDate!),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        core.height10,
        core.divider1,
        const Text(
          "₹0 ",
          style: TextStyle(fontSize: 20),
        ),
        core.height10,
        Text(
          "₹${orders.totalPrice.toString()}",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
        core.height10,
        core.divider1,
      ],
    ));
  }
}
