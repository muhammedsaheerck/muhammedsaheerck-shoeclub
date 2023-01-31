import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/infrastructure/order/order_services.dart';
import 'package:shoeclub/presentation/home/product_details.dart';
import 'package:shoeclub/presentation/settings/orders/screen_order_summary.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';
import '../../../core/core_datas.dart';

class ScreenMyOrders extends StatelessWidget {
  const ScreenMyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await OrdersApiCall().getAllOrders(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MY ORDERS',
          style: GoogleFonts.inika(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: CoreDatas.instance.buttonColor,
          ),
        ),
        iconTheme: const IconThemeData(),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const BottomNavigationBarWidget(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, valueProvider, child) => valueProvider
                .orderDetails!.orders!.isEmpty
            ? Center(
                child: Image.asset(
                "asset/no-order.jpg",
                height: 500,
                width: double.infinity,
              ))
            : ListView.separated(
                itemCount: valueProvider.orderDetails!.orders!.length,
                itemBuilder: (context, index) {
                  final order = valueProvider.orderDetails!.orders![index];
                  return Card(
                    elevation: 2,
                    color: Colors.deepPurple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Date : ${valueProvider.parseDate(valueProvider.orderDetails!.orders![index].orderDate!)}",
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CoreDatas.instance.height10,
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: order.products!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenProductDetails(
                                              product: order
                                                  .products![index]!.product!),
                                    ));
                                  },
                                  child: Image.network(
                                    "${order.products![index]!.product!.image!.first}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 5,
                              ),
                            ),
                          ),
                          CoreDatas.instance.height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  maxRadius: 12,
                                  backgroundColor: Colors.grey,
                                  child: order.orderStatus == "CANCELED"
                                      ? Image.asset(
                                          "asset/cancel-order.png",
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          "asset/order-Confirmed.png",
                                          fit: BoxFit.fill,
                                        )),
                              CoreDatas.instance.width10,
                              Text(
                                order.orderStatus.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CoreDatas.instance.height5,
                              CoreDatas.instance.width20,
                              Consumer<OrderProvider>(
                                builder: (context, valueProvider, child) =>
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: Colors.purple,
                                                width: 2)),
                                        onPressed: (() {
                                          valueProvider.cancelOrder(
                                              order.id!, context);
                                        }),
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(
                                              color: CoreDatas
                                                  .instance.buttonColor),
                                        )),
                              ),
                              CoreDatas.instance.width20,
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.purple, width: 2)),
                                  onPressed: (() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenOrderSummary(orders: order),
                                    ));
                                  }),
                                  child: Text(
                                    "SUMMARY",
                                    style: TextStyle(
                                        color: CoreDatas.instance.buttonColor),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              ),
      ),
    );
  }
}
