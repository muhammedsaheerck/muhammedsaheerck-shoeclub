import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/product_details/product_details.dart';
import 'package:shoeclub/presentation/splash/widgets/text_ittaliana.dart';

import 'widgets/dropdownn_filter_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    ProductApiCalls().getProducts();
    return SafeArea(
      child: Scaffold(
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
                    color: buttonColor2,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * 0.13,
                child: const DropdownFilter(),
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
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (context, value, child) =>
                //  GridView.builder(
                //     shrinkWrap: true,
                //     physics: const ScrollPhysics(),
                //     itemCount: value.length,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         crossAxisSpacing: 0.0,
                //         mainAxisSpacing: 0.0),
                //     itemBuilder: ((context, index) {
                //       return Card(
                //         color: cardColorAlilceBlue,
                //         elevation: 1,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15)),
                //         child: ListView(
                //           physics: const NeverScrollableScrollPhysics(),
                //           // crossAxisAlignment: CrossAxisAlignment.start,
                //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Container(
                //               decoration: const BoxDecoration(
                //                 borderRadius: BorderRadius.only(
                //                     topLeft: Radius.circular(30),
                //                     topRight: Radius.circular(30)),
                //               ),
                //               height: MediaQuery.of(context).size.height * 0.11,
                //               // color: Colors.amber,
                //               width: double.infinity,
                //               child: InkWell(
                //                 onTap: () {
                //                   Navigator.of(context).push(MaterialPageRoute(
                //                       builder: ((context) =>
                //                           const ScreenProductDetails())));
                //                 },
                //                 child: Image.network(
                //                   value[index]["image"][0], fit: BoxFit.fill,
                //                   // width: double.infinity,
                //                   // height: MediaQuery.of(context).size.height * 0.2,
                //                 ),
                //               ),
                //             ),
                //             const Divider(thickness: 2),
                //             Padding(
                //               padding: const EdgeInsets.only(
                //                 left: 8,
                //                 right: 8,
                //               ),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   const Text(
                //                     "Nike",
                //                     style: TextStyle(
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                   IconButton(
                //                       onPressed: () {},
                //                       icon: const Icon(Icons.favorite_border))
                //                 ],
                //               ),
                //             ),
                //             const Padding(
                //               padding: EdgeInsets.only(
                //                 left: 10.0,
                //               ),
                //               child: Text("₹ 2500"),
                //             ),
                //           ],
                //         ),
                //       );
                //     })),

                ListView.builder(
                    itemCount: value.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: ((context, index) {
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  // width: double.infinity,
                                  child: Image.network(
                                    value[index]["image"][0], fit: BoxFit.fill,
                                    // width: double.infinity,
                                    // height: MediaQuery.of(context).size.height * 0.2,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              value[index]["name"],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500,
                                                  color: cardColorAlilceBlue),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: (() {}),
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        value[index]["description"],
                                        maxLines: 2,
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
                                            "₹ ${value[index]["price"].toString()}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: cardColorAlilceBlue),
                                          ),
                                          // SizedBox(
                                          //   height: 30,
                                          //   child: ElevatedButton(
                                          //     style: ElevatedButton.styleFrom(
                                          //       padding: const EdgeInsets.only(
                                          //           left: 5, right: 5),
                                          //       elevation: 1,
                                          //       backgroundColor:
                                          //           Colors.amber.shade600,
                                          //     ),
                                          //     onPressed: (() {}),
                                          //     child: Text(
                                          //       "MOVE TO BAG",
                                          //       style: TextStyle(
                                          //           color: buttonColor),
                                          //     ),
                                          //   ),
                                          // ),
                                          IconButton(
                                            onPressed: (() {}),
                                            icon: const Icon(
                                              Icons.shopping_bag,
                                              color: Colors.white,
                                            ),
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
          )
        ]),
      ),
    );
  }
}
