import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/presentation/checkout/payment_details.dart';
import 'package:shoeclub/presentation/checkout/screen_add_address.dart';

import '../../core/const_datas.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Address",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Muhammed Saheer ck",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const ScreenAddAddress())));
                            }),
                            child: const Text("Edit "))
                      ],
                    ),
                    const Text(
                      "Hilit Business Park",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      "Kozhikkode",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      "1234567898",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            height30,
            Card(
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
