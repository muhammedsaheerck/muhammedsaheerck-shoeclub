import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/presentation/cart/screen_cart.dart';

class ScreenWhishlist extends StatelessWidget {
  const ScreenWhishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: splashColorPlatinum,
          iconTheme: const IconThemeData(),
          title: Center(
            child: Text(
              'Whishllist',
              style: GoogleFonts.inika(
                fontWeight: FontWeight.bold,
                fontSize: 25,color: buttonColor
              ),
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
        body: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: cardColorAlilceBlue,
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
                          // color: Colors.amber,
                        ),
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.height * 0.2,
                        // width: double.infinity,
                        child: Image.asset(
                          "asset/product5.png", fit: BoxFit.fill,
                          // width: double.infinity,
                          // height: MediaQuery.of(context).size.height * 0.2,
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
                                  const Text(
                                    "Nike",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                    onPressed: (() {}),
                                    icon: const Icon(Icons.favorite,color: Colors.red,),
                                  )
                                ],
                              ),
                              const Text("₹ 2500"),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(),
                                onPressed: (() {}),
                                child: const Text("MOVE TO BAG",
                                    style: TextStyle(
                                        color: Color.fromRGBO(237, 91, 78, 1))),
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
