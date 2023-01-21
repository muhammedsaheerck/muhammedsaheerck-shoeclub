import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/application/aProduct/aproduct_provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';

import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/home/widgets/product_details.dart';
import 'package:shoeclub/presentation/splash/widgets/text_ittaliana.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  List<String> filter = <String>['All', 'Casual', 'Formal', 'Sports'];

  // String dropdownValue = "All";

  @override
  Widget build(BuildContext context) {
    ProductApiCalls().getProducts();

    Provider.of<CartProvider>(context, listen: false).getAllCart();
    Provider.of<CartProvider>(context, listen: false).findTotalQuantity();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final user = sharedPreferences.getString("UserId");
      log(user.toString());
      WhishListProvider().userIdGet(user!);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        leadingWidth: 100,
        // backgroundColor: splashColorPlatinum,
        backgroundColor: test,
        leading: Image.asset(
          "asset/logo2.png",
          // height: 50,
          // width: 50,
          fit: BoxFit.fill,
          color: Colors.black,
        ),
        title: TextItalianaWidget(
          name: "Shoe Club",
          size: MediaQuery.of(context).size.height * 0.050,
        ),
      ),
      // backgroundColor: splashColorPlatinum,
      backgroundColor: test,
      body: ListView(children: [
        height10,
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: backgroundColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: buttonColor, fontSize: 18),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: const EdgeInsets.only(left: 2, right: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.13,
              child:
                  // const DropdownFilter(),
                  Consumer<HomeProvider>(
                builder: (context, valueProvider, child) =>
                    DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    customButton: const Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.white,
                    ),

                    items: filter
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem(
                                  value: value,
                                  onTap: () {
                                    if (value == "All") {
                                      valueFound.value =
                                          productListNotifier.value;
                                      log("casualaaa" + valueFound.toString());
                                    } else if (value == "Casual") {
                                      valueFound.value =
                                          productCasualListNotifier.value;
                                      log("+++++++++" + valueFound.toString());
                                    } else if (value == "Formal") {
                                      valueFound.value =
                                          productFormalListNotifier.value;
                                    } else {
                                      valueFound.value =
                                          productSportsListNotifier.value;
                                    }
                                    // valueProvider.dropdownShowProducts(value);
                                  },
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                        .toList(),
                    //     const [
                    //   DropdownMenuItem(
                    //     value: 0,
                    //     child: Text(
                    //       "All",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    //   DropdownMenuItem(
                    //     value: 1,
                    //     child: Text(
                    //       "Casual",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    //   DropdownMenuItem(
                    //     value: 2,
                    //     child: Text(
                    //       "Formal",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    //   DropdownMenuItem(
                    //     value: 3,
                    //     child: Text(
                    //       "Sports",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   )
                    // ],

                    value: HomeProvider().selectedValue,

                    onChanged: (String? value) {
                      valueProvider.dropdownFilter(value!);
                    },
                    dropdownDirection: DropdownDirection.right,
                    itemHeight: 40,
                    style: TextStyle(color: buttonColor),
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 150,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(10)),
                      color: Colors.deepPurple.shade100,
                    ),

                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    // offset: const Offset(-20, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
        height10,
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800)),
          items: [
            Image.asset("asset/splash.png", fit: BoxFit.fill),
            Image.asset("asset/shoe2.jpg", fit: BoxFit.fill),
            Image.asset("asset/shoe3.jpg", fit: BoxFit.fill),
            Image.asset("asset/shoe4.jpg", fit: BoxFit.fill),
            Image.asset(
              "asset/shoe5.jpg",
              fit: BoxFit.fill,
            )
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: i);
              },
            );
          }).toList(),
        ),
        height10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Collection',
            style: GoogleFonts.inika(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        height10,
        Consumer<HomeProvider>(
          builder: (context, valueprovider, child) => ValueListenableBuilder(
            valueListenable: valueFound,
            builder: (context, valueLi, child) => ListView.builder(
                itemCount: valueFound.value.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  final value = valueFound.value[index];
                  log("valueee" + value.toString());
                  // log("================" + valueFound.toString());
                  // log(value["image"][0].toString());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      // color: cardColorAlilceBlue,
                      color: Colors.black87,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 6,
                              // width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  // log(value[index].toString());
                                  // aProductDetails.clear();
                                  // aProductDetails.add(value);
                                  // log("name :===="+aProductDetails[0]["name"].toString());
                                  // log("asdas"+aProductDetails.toString());
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) {
                                        return ScreenProductDetails(
                                          product: value,
                                        );
                                      }),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  // value["image"][0]
                                  value!.image!.first!,
                                  fit: BoxFit.fill,

                                  // width: double.infinity,
                                  // height: MediaQuery.of(context).size.height * 0.2,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          value.name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: cardColorAlilceBlue),
                                        ),
                                      ),
                                      Consumer<WhishListProvider>(
                                        builder:
                                            (context, valueProvider, child) =>
                                                Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              await valueProvider.addTOWishlist(
                                                  userId!, value.id!, context);
                                            },
                                            child: valueProvider
                                                        .searchIdForWishlist(
                                                            value) ==
                                                    true
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                : const Icon(
                                                    Icons.favorite,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    value.description!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: cardColorAlilceBlue),
                                  ),
                                  // height10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ ${value.price.toString()}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: cardColorAlilceBlue),
                                      ),
                                      Consumer<CartProvider>(
                                        builder: (context, valueProvider,
                                                child) =>
                                            GestureDetector(
                                                onTap: () {
                                                  valueProvider.addToCart(
                                                    value,
                                                    AProductProvider()
                                                        .selectedSize,
                                                    context,
                                                  );
                                                },
                                                child: valueprovider
                                                            .searchIdForCart(
                                                                value) ==
                                                        false
                                                    ? const Icon(
                                                        Icons.shopping_bag,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Icons.shopping_basket,
                                                        color: Colors.white,
                                                      )),
                                      )
                                    ],
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
        )
      ]),
    );
  }
}
