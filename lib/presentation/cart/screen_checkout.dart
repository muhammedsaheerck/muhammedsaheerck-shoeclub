import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/cart/checkout_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/presentation/cart/widgets/order_details.dart';
import 'package:shoeclub/presentation/cart/screen_address.dart';
import '../../application/cart/cart_provider.dart';
import '../../core/core_datas.dart';
import '../widgets/appbar_customWidget.dart';
import 'widgets/checkout_show_address.dart';

class ScreenCheckOut extends StatelessWidget {
  final AddressElements address;
  const ScreenCheckOut({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getAllCart();
    return Scaffold(
      backgroundColor: CoreDatas.instance.splashColorPlatinum,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomWidget(
            appBarName: "CHECKOUT",
          )),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView(
          children: [
            ValueListenableBuilder(
              valueListenable: cartNotifierList,
              builder: (context, value, child) => ListView.builder(
                itemCount: value.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  final cartProduct = value[index]!.product;
                  return Card(
                    elevation: 2,
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.17,
                          child: Image.network(
                            cartProduct!.image!.first!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        cartProduct.name!,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      CoreDatas.instance.height5,
                                      Text(
                                        cartProduct.description!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "₹ ${(cartProduct.price! * value[index]!.qty!).toString()}",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Consumer<CartProvider>(
                                  builder: (context, valueProvider, child) =>
                                      Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.deepPurple.shade100,
                                            minimumSize: const Size(25, 25),
                                            shape: const CircleBorder()),
                                        onPressed: (() {
                                          valueProvider.qtyChangeCart(
                                            cartProduct,
                                            HomeProvider().selectedSize,
                                            1,
                                          );
                                        }),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        value[index]!.qty.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(25, 25),
                                            backgroundColor:
                                                Colors.deepPurple.shade100,
                                            shape: const CircleBorder()),
                                        onPressed: (() {
                                          valueProvider.qtyChangeCart(
                                            cartProduct,
                                            HomeProvider().selectedSize,
                                            -1,
                                          );
                                        }),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, value, child) => OrderDetails(
                          amount: value.findTotalQuantity().toString(),
                          name: 'Total Quantity :',
                        ),
                      ),
                      CoreDatas.instance.divider2,
                      ValueListenableBuilder(
                        valueListenable: totalAmount,
                        builder: (context, value, child) {
                          // final total = value + 99;
                          return OrderDetails(
                            amount: value.toString(),
                            name: 'Total Amount :',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CheckoutAddressShow(address: address),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CheckoutProvider>(
                builder: (context, valueProvider, child) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade100,
                      ),
                      child: RadioListTile(
                        activeColor: Colors.deepPurple,
                        title: const Text("Cash on Delivery"),
                        value: PaymentType.COD,
                        groupValue: valueProvider.selectedPayment,
                        onChanged: ((value) {
                          log(value.toString());
                          valueProvider.radioSelectPayments(value!);
                        }),
                      ),
                    ),
                    CoreDatas.instance.height10,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade100,
                      ),
                      child: RadioListTile(
                        activeColor: Colors.deepPurple,
                        title: const Text("Online Payment"),
                        value: PaymentType.ONLINE_PAYMENT,
                        groupValue: valueProvider.selectedPayment,
                        onChanged: ((value) {
                          log(value.toString());
                          valueProvider.radioSelectPayments(value!);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CoreDatas.instance.height10,
            Consumer<CheckoutProvider>(
              builder: (context, valueProvider, child) => ElevatedButton(
                  style: CoreDatas.instance.buttonStyle,
                  onPressed: (() {
                    if (valueProvider.selectedPayment ==
                        PaymentType.ONLINE_PAYMENT) {
                      valueProvider.payment(
                        context,
                        address,
                      );
                    } else {
                      Provider.of<OrderProvider>(context, listen: false)
                          .orderCreate(address, PaymentType.COD,
                              cartNotifierList.value, context);
                    }
                  }),
                  child: const Text("CONTINUE")),
            ),
          ],
        ),
      ),
    );
  }
}
