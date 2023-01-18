import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/presentation/cart/screen_cart.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../infrastructure/whishlist/whishlist_services.dart';
import '../product_details/product_details.dart';

class ScreenWhishlist extends StatelessWidget {
  const ScreenWhishlist({super.key});

  @override
  Widget build(BuildContext context) {
    WhishlistApiCalls().getWishlist(userId);
    // log("wishlist"+wishlistnotifier.value.toString());
    return Scaffold(
      // backgroundColor: splashColorPlatinum,
      backgroundColor: test,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        // backgroundColor: splashColorPlatinum,
        backgroundColor: test,
        iconTheme: const IconThemeData(),
        title: Center(
          child: Text(
            'Wishlist',
            style: GoogleFonts.inika(
                fontWeight: FontWeight.bold, fontSize: 25, color: buttonColor),
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
                height: 200,
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.height * 0.2,
                            // width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                // aProductDetails.clear();
                                // aProductDetails.add(valueLis[index]);
                                // log("name :===="+aProductDetails[0]["name"].toString());
                                // log("asdas"+aProductDetails.toString());
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
                                // width: double.infinity,
                                // height: MediaQuery.of(context).size.height * 0.2,
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
                                              value.addTOWishlist(userId!,
                                                  product.id!, context);
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
                                    "₹ ${product.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: cardColorAlilceBlue),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.white)),
                                    onPressed: (() {}),
                                    child: Text("MOVE TO BAG",
                                        style: TextStyle(
                                            color: cardColorAlilceBlue)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
