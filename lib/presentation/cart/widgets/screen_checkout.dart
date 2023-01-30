import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/cart/checkout_provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/presentation/cart/widgets/order_details.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_address.dart';

import '../../../application/aProduct/aproduct_provider.dart';
import '../../../application/address/address_provider.dart';
import '../../../application/cart/cart_provider.dart';
import '../../../core/core_datas.dart';

class ScreenCheckOut extends StatelessWidget {
  AddressElements address;
  ScreenCheckOut({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getAllCart();
    log("----------------------" + address.toString());
    return Scaffold(
      backgroundColor: CoreDatas.instance.splashColorPlatinum,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CHECKOUT',
          style: GoogleFonts.inika(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: CoreDatas.instance.buttonColor,
          ),
        ),
        iconTheme: const IconThemeData(),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
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
                  log("cartttttttttttttt" + cartProduct.toString());

                  return Card(
                    elevation: 2,
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      //  const SizedBox(height: 60,),

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
                                            AProductProvider().selectedSize,
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
                                              AProductProvider().selectedSize,
                                              -1,
                                            );
                                          }),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ))
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
                // color: cardColorAlilceBlue,
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
              child: Card(
                elevation: 5,
                color: Colors.deepPurple.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.fullName!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.phone!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.address!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.place!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.state!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.pin!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CoreDatas.instance.height5,
                      Text(
                        overflow: TextOverflow.ellipsis,
                        address.landMark!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
