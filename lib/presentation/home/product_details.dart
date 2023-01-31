import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import 'package:shoeclub/presentation/cart/screen_cart.dart';
import 'package:shoeclub/presentation/home/widgets/circleavathar_size.dart';
import 'package:shoeclub/presentation/home/widgets/image_change.dart';
import '../../core/core_datas.dart';

class ScreenProductDetails extends StatelessWidget {
  final Product product;
  const ScreenProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CoreDatas.instance.test,
        appBar: AppBar(
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
                  valueProvider.addTOWishlist(
                      CoreDatas.instance.userId!, product.id!, context);
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
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => Image.network(
                    product.image![value.selectedImageValue]!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageChange(index: 0, product: product),
                  CoreDatas.instance.width10,
                  ImageChange(
                    product: product,
                    index: 1,
                  ),
                  CoreDatas.instance.width10,
                  ImageChange(index: 2, product: product),
                ],
              ),
              CoreDatas.instance.height30,
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
              CoreDatas.instance.height20,
              const Text(
                "OverView",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              CoreDatas.instance.height10,
              Text(
                product.description!,
              ),
              CoreDatas.instance.height20,
              const Text(
                "Select Size(UK Size)",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              CoreDatas.instance.height20,
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
              CoreDatas.instance.height30,
              SizedBox(
                child: Consumer<CartProvider>(
                  builder: (context, valueProvider, child) =>
                      Provider.of<HomeProvider>(context)
                                  .searchIdForCart(product) ==
                              false
                          ? ElevatedButton(
                              style: CoreDatas.instance.buttonStyle,
                              onPressed: (() {
                                valueProvider.addToCart(
                                  product,
                                  HomeProvider().selectedSize,
                                  context,
                                );
                              }),
                              child: const Text("ADD TO BAG"))
                          : ElevatedButton(
                              style: CoreDatas.instance.buttonStyle,
                              onPressed: (() {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: ((context) => const ScreenCart()),
                                  ),
                                );
                              }),
                              child: const Text("GO TO BAG"),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
