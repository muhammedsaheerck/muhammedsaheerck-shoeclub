import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/cart/checkout_provider.dart';

import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/presentation/cart/widgets/order_details.dart';

import 'package:shoeclub/presentation/cart/widgets/screen_add_address.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_checkout.dart';

import '../../../core/core_datas.dart';

enum PaymentType { COD, ONLINE_PAYMENT }

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<AddressProvider>(context, listen: false).getAllAddresses();

//
    return Scaffold(
      backgroundColor: CoreDatas.instance.splashColorPlatinum,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ADDRESS',
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              // color: CoreDatas.instance.headMainColor,
              color: Colors.purple.shade500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "  Address",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => ScreenAddAddress(
                                  type: ActionType.addAddress,
                                )),
                          ),
                        );
                      }),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: CoreDatas.instance.addressListNotifier,
              builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: CoreDatas.instance.addressListNotifier.value.length,
                itemBuilder: (context, index) {
                  final address = value[index];

                  // log("addddd" + address.toString());
                  return Card(
                    elevation: 2,
                    color: Colors.deepPurple.shade50,
                    child: Row(
                      children: [
                        Consumer<AddressProvider>(
                          builder: (context, valueProvider, child) => Radio(
                              activeColor: Colors.deepPurple,
                              value: address,
                              groupValue: valueProvider.selectedAddress,
                              onChanged: ((value) {
                                valueProvider.radioSelectAddress(value!);
                              })),
                        ),
                        Expanded(
                          child: InkWell(
                            onLongPress: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => ScreenAddAddress(
                                        type: ActionType.editAddress,
                                        address: address,
                                      )),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                color: Colors.deepPurple.shade100,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              address!.fullName!,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                address.title!,
                                                style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        address.phone!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        address.address!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        address.pin!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${address.place},",
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          CoreDatas.instance.width10,
                                          Expanded(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${address.state!},",
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              address.landMark!,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Consumer<AddressProvider>(
                                              builder:
                                                  (context, value, child) =>
                                                      IconButton(
                                                          onPressed: (() {
                                                            PopUpWidget(context,
                                                                value, address);
                                                          }),
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          )),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CoreDatas.instance.height10,
            SizedBox(
              height: 50,
              child: Card(
                color: Colors.purple.shade500,
                // color: CoreDatas.instance.headMainColor,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Price Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: CoreDatas.instance.headMainColor, width: 3),
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
                        CoreDatas.instance.height10,
                        const OrderDetails(
                          // amount: '₹99',
                          amount: "0",
                          name: 'Delivery Fee :',
                        ),
                        CoreDatas.instance.divider2,
                        ValueListenableBuilder(
                          valueListenable: CoreDatas.instance.totalAmount,
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
            ),
            CoreDatas.instance.height10,
            CoreDatas.instance.height10,
            Consumer<AddressProvider>(
              builder: (context, valueProvider, child) => ElevatedButton(
                  style: CoreDatas.instance.buttonStyle,
                  onPressed: (() {
                    // log("onpressed address" + address.toString());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => ScreenCheckOut(
                              address: valueProvider.selectedAddress!,
                            ))));
                  }),
                  child: const Text("CONTINUE")),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> PopUpWidget(
    BuildContext context,
    AddressProvider value,
    AddressElements address,
  ) {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: const Text('Do you Delete This Address?',
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
                value.deleteAAddress(address.id!, context);
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
