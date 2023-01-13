import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shoeclub/presentation/checkout/screen_checkout.dart';

import '../../core/const_datas.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    CardPaymentType(),
                    height10,
                    CardPaymentType(),
                    height10,
                    CardPaymentType(),
                  ],
                ),
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
                  child: const Text("CONFIRM")),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPaymentType extends StatelessWidget {
  const CardPaymentType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          ],
        ),
      ),
    );
  }
}
