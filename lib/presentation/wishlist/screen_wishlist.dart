import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/presentation/cart/screen_cart.dart';
import '../../core/core_datas.dart';
import '../../infrastructure/whishlist/whishlist_services.dart';
import '../home/product_details.dart';

class ScreenWhishlist extends StatelessWidget {
  const ScreenWhishlist({super.key});

  @override
  Widget build(BuildContext context) {
    WhishlistApiCalls().getWishlist(CoreDatas.instance.userId);
    return Scaffold(
      backgroundColor: CoreDatas.instance.test,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: CoreDatas.instance.test,
        iconTheme: const IconThemeData(),
        title: Center(
          child: Text(
            'Wishlist',
            style: GoogleFonts.inika(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: CoreDatas.instance.buttonColor),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const ScreenCart())));
              }),
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: wishlistnotifier,
        builder: (context, valueLis, child) => valueLis.isEmpty
            ? Center(
                child: Image.asset(
                "asset/wish-list.png",
                height: 150,
              ))
            : ListView.builder(
                itemCount: valueLis.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  final product = valueLis[index]!.product;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black87,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return ScreenProductDetails(
                                        product: product,
                                      );
                                    }),
                                  ),
                                );
                              },
                              child: Image.network(
                                product!.image!.first!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          product.name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Expanded(
                                        child: Consumer<WhishListProvider>(
                                          builder: (context, value, child) =>
                                              IconButton(
                                            onPressed: (() async {
                                              value.addTOWishlist(
                                                  CoreDatas.instance.userId!,
                                                  product.id!,
                                                  context);
                                              // value.searchIdForWishlist(product);
                                            }),
                                            icon: const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "??? ${product.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: CoreDatas
                                            .instance.cardColorAlilceBlue),
                                  ),
                                  Consumer<CartProvider>(
                                    builder: (context, valueProvider, child) =>
                                        Provider.of<HomeProvider>(context)
                                                    .searchIdForCart(product) ==
                                                false
                                            ? OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        color: Colors.white)),
                                                onPressed: (() {
                                                  valueProvider.addToCart(
                                                    product,
                                                    HomeProvider().selectedSize,
                                                    context,
                                                  );
                                                }),
                                                child: Text(
                                                  "MOVE TO BAG",
                                                  style: TextStyle(
                                                      color: CoreDatas.instance
                                                          .cardColorAlilceBlue),
                                                ),
                                              )
                                            : OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        color: Colors.white)),
                                                onPressed: (() {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const ScreenCart()),
                                                    ),
                                                  );
                                                }),
                                                child: Text(
                                                  "Go TO BAG",
                                                  style: TextStyle(
                                                      color: CoreDatas.instance
                                                          .cardColorAlilceBlue),
                                                ),
                                              ),
                                  ),
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
    );
  }
}
