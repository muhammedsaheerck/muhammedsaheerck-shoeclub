import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/product/product_provider.dart';
import 'package:shoeclub/core/const_datas.dart';

import '../checkout/screen_checkout.dart';
import '../home/screen_home.dart';

class ScreenProductDetails extends StatelessWidget {
  const ScreenProductDetails({super.key});

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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 30,
                ))
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
                    aProductDetails[0]["image"][value.selectedValue],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageChange(index: 0),
                  width10,
                  ImageChange(
                    index: 1,
                  ),
                  width10,
                  ImageChange(index: 2),
                ],
              ),
              height30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    aProductDetails[0]["name"],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("₹ ${aProductDetails[0]["price"].toString()}",
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
                aProductDetails[0]["description"],
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
                    text: '6',
                  ),
                  CircleAvstharSizeWidget(
                    text: '7',
                  ),
                  CircleAvstharSizeWidget(
                    text: '8',
                  ),
                  CircleAvstharSizeWidget(
                    text: '9',
                  ),
                  CircleAvstharSizeWidget(
                    text: '10',
                  ),
                ],
              ),
              height30,
              SizedBox(
                child: ElevatedButton(
                    style: buttonStyle,
                    // ElevatedButton.styleFrom(
                    //     elevation: 1,
                    //     backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                    onPressed: (() {}),
                    child: const Text("ADD TO BAG")),
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
  ImageChange({Key? key, required this.index}) : super(key: key);

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
            aProductDetails[0]["image"][index],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class CircleAvstharSizeWidget extends StatelessWidget {
  final String text;
  const CircleAvstharSizeWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.black,
      radius: 25,
      child: TextButton(
          onPressed: (() {}),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          )),
    );
  }
}
