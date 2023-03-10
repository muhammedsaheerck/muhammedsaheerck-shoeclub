import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/presentation/cart/screen_address.dart';
import 'package:shoeclub/presentation/home/product_details.dart';
import '../../core/core_datas.dart';
import '../../domain/modal/product/product_modal.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getAllCart();
    Provider.of<CartProvider>(context, listen: false).findTotalQuantity();
    Provider.of<AddressProvider>(context, listen: false).getAllAddresses();
    return Scaffold(
      backgroundColor: CoreDatas.instance.test,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.inika(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: CoreDatas.instance.buttonColor,
          ),
        ),
        iconTheme: const IconThemeData(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ValueListenableBuilder(
              valueListenable: cartNotifierList,
              builder: (context, value, child) => cartNotifierList.value.isEmpty
                  ? Center(
                      child: Image.asset(
                        "asset/empty-cart.png",
                        height: 200,
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: ((context, index) {
                        final cartProduct = value[index]!.product;
                        return Slidable(
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                Consumer<CartProvider>(
                                  builder: (context, valueProvider, child) =>
                                      SlidableAction(
                                    onPressed: ((context) {
                                      popUpWidget(
                                          cartProduct!, context, valueProvider);
                                    }),
                                    icon: Icons.delete,
                                    label: "Delete",
                                  ),
                                )
                              ]),
                          child: Card(
                            elevation: 2,
                            color: Colors.black87,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return ScreenProductDetails(
                                            product: cartProduct,
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    child: Image.network(
                                      cartProduct!.image!.first!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
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
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              //  const SizedBox(height: 60,),

                                              Text(
                                                "??? ${(cartProduct.price! * value[index]!.qty!).toString()}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Consumer<CartProvider>(
                                          builder:
                                              (context, valueProvider, child) =>
                                                  Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .deepPurple.shade100,
                                                    minimumSize:
                                                        const Size(25, 25),
                                                    shape:
                                                        const CircleBorder()),
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
                                                      minimumSize:
                                                          const Size(25, 25),
                                                      backgroundColor: Colors
                                                          .deepPurple.shade100,
                                                      shape:
                                                          const CircleBorder()),
                                                  onPressed: (() {
                                                    log({value[index]!.qty! > 0}
                                                        .toString());
                                                    if (value[index]!.qty! >
                                                        1) {
                                                      valueProvider
                                                          .qtyChangeCart(
                                                        cartProduct,
                                                        HomeProvider()
                                                            .selectedSize,
                                                        -1,
                                                      );
                                                    } else {
                                                      if (value[index]!.qty! <
                                                          2) {
                                                        valueProvider
                                                            .removeFromCart(
                                                                cartProduct,
                                                                context);
                                                      }
                                                    }
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
                          ),
                        );
                      }),
                    ),
            ),
          ),
          CoreDatas.instance.height10,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Provider.of<CartProvider>(context).cartItmLength()} Items in Cart",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Quantity ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return Text(
                            value.findTotalQuantity().toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ],
                  ),
                  CoreDatas.instance.height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bag Total ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      ValueListenableBuilder(
                        valueListenable: totalAmount,
                        builder: (context, value, child) => Text(
                          value.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  CoreDatas.instance.height20,
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: ElevatedButton(
                        style: CoreDatas.instance.buttonStyle,
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const ScreenAddress())));
                        }),
                        child: const Text("PLACE ORDER")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> popUpWidget(Product product, context, CartProvider provider) {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: const Text('Do you Delete This product in cart?',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: (() {
                  return Navigator.pop(context);
                }),
                child: Text('Cancel',
                    style: GoogleFonts.nunito(color: Colors.white))),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: (() {
                provider.removeFromCart(product, context);
                Navigator.of(context).pop();
              }),
              child: Text(
                'Delete',
                style: GoogleFonts.nunito(color: Colors.white),
              ),
            )
          ],
        );
      }),
    );
  }
}
