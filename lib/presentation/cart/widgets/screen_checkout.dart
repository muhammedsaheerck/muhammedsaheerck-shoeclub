import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/infrastructure/address/address_services.dart';
import 'package:shoeclub/presentation/cart/widgets/payment_details.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_add_address.dart';

import '../../../core/const_datas.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    AddressProvider().getAllAddresses();
    return Scaffold(
      backgroundColor: splashColorPlatinum,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CHECKOUT',
          style: GoogleFonts.inika(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: buttonColor,
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
              color: Colors.deepPurple,
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
              valueListenable: addressListNotifier,
              builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: addressListNotifier.value.length,
                itemBuilder: (context, index) {
                  final address = value[index];
                  // log("addddd" + address.toString());
                  return Card(
                    elevation: 2,
                    color: Colors.deepPurple.shade100,
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
                                          width10,
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
                                              builder: (context, value,
                                                      child) =>
                                                  IconButton(
                                                      onPressed: (() {
                                                        value.deleteAAddress(
                                                            address.id!,
                                                            context);
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
            height30,
            Expanded(
              child: Card(
                color: cardColorAlilceBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const OrderDetails(
                        amount: '₹100',
                        name: 'Order :',
                      ),
                      height10,
                      const OrderDetails(
                        amount: '₹10',
                        name: 'Delivery :',
                      ),
                      divider1,
                      const OrderDetails(
                        amount: '₹110',
                        name: 'Total :',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            height30,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Payment",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            Card(
              color: cardColorAlilceBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcXyqtLQ_gexpplNlllSl0iZ9HkyerYeH4mQ&usqp=CAU",
                      width: 40,
                      height: 40,
                    ),
                    const Text("**131242"),
                    TextButton(
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const ScreenPayment())));
                        }),
                        child: const Text("Change"))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(35),
                    elevation: 1,
                    backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const ScreenCheckout())));
                }),
                child: const Text("PAY NOW")),
          ],
        ),
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final String name;
  final String amount;
  const OrderDetails({Key? key, required this.amount, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          amount,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
