import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/domain/modal/order/order_modal.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/settings/widgets/screen_myorders.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';

import '../../../core/core_datas.dart';

class ScreenOrderSummary extends StatelessWidget {
  final Orders orders;
  const ScreenOrderSummary({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final core = CoreDatas.internal();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.purple,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Package Summary',
              style: GoogleFonts.inika(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ScreenMyOrders(),
                  ));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        core.height10,
                        const Text(
                          "OrderStatus :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        const Text(
                          "paymentType",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        const Text(
                          "paymentStatus",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        const Text(
                          "OrderDate",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        const Text(
                          "deliveryDate",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        core.divider1,
                        const Text(
                          "Delivery Fee ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        const Text(
                          "Total Price ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        core.height10,
                        core.divider1,
                      ],
                    ),
                  ),
                  Flexible(
                      // flex: 2,
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
                        orders.paymentStatus.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      core.height10,
                      Text(
                        orders.orderDate.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      core.height10,
                      Text(
                        orders.deliveryDate.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
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
                  ))
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
              // core.height10,
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
                  // OutlinedButton.styleFrom(
                  //     side:
                  //         const BorderSide(color: Colors.purple, width: 2)),
                  onPressed: (() async {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: ((context) => BottomNavigationBarWidget()),
                        ),
                        (route) => false);
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
}
