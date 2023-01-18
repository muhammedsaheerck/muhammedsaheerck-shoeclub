import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/aProduct/aproduct_provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/product/product_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import 'package:shoeclub/presentation/cart/screen_cart.dart';

import '../../infrastructure/cart/cart_services.dart';
import '../checkout/screen_checkout.dart';

class ScreenProductDetails extends StatelessWidget {
  Product product;
  ScreenProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: test,
        appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: splashColorPlatinum),
          iconTheme: const IconThemeData(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: [
            Consumer<WhishListProvider>(
              builder: (context, valueProvider, child) => IconButton(
                onPressed: () {
                  valueProvider.addTOWishlist(userId!, product.id!, context);
                },
                icon: valueProvider.searchIdForWishlist(product) == true
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                // color: Colors.amber,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Consumer<ProductProvider>(
                  builder: (context, value, child) => Image.network(
                    product.image![value.selectedValue]!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageChange(index: 0, product: product),
                  width10,
                  ImageChange(
                    product: product,
                    index: 1,
                  ),
                  width10,
                  ImageChange(index: 2, product: product),
                ],
              ),
              height30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("₹ ${product.price.toString()}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              height20,
              const Text(
                "OverView",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              height10,
              Text(
                product.description!,
              ),
              height20,
              const Text(
                "Select Size(UK Size)",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvstharSizeWidget(
                    size: "6",
                    text: '6',
                  ),
                  CircleAvstharSizeWidget(
                    size: "7",
                    text: '7',
                  ),
                  CircleAvstharSizeWidget(
                    size: "8",
                    text: '8',
                  ),
                  CircleAvstharSizeWidget(
                    size: "9",
                    text: '9',
                  ),
                  CircleAvstharSizeWidget(
                    size: "10",
                    text: '10',
                  ),
                ],
              ),
              height30,
              SizedBox(
                child: Consumer<CartProvider>(
                  builder: (context, valueProvider, child) => ElevatedButton(
                      style: buttonStyle,
                      // ElevatedButton.styleFrom(
                      //     elevation: 1,
                      //     backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                      onPressed: (() {
                        valueProvider.addToCart(
                          product,
                          AProductProvider().selectedSize,
                          context,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: ((context) => const ScreenCart()),
                          ),
                        );
                      }),
                      child: const Text("ADD TO BAG")),
                ),
              ),
              // height10,
              SizedBox(
                child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => const ScreenCheckout())));
                    }),
                    child: const Text("BUY NOW")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageChange extends StatelessWidget {
  int index;
  Product product;
  ImageChange({Key? key, required this.index, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          value.selectedImage(index);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.only(left: 2, right: 5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              // color: Colors.deepPurple,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width * 0.13,
          child: Image.network(
            product.image![index]!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class CircleAvstharSizeWidget extends StatelessWidget {
  final String text;
  final String size;
  const CircleAvstharSizeWidget(
      {Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.black,
      radius: 25,
      child: Consumer<AProductProvider>(
        builder: (context, valueProvider, child) => TextButton(
            onPressed: (() {
              valueProvider.selectSize(size);
            }),
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
