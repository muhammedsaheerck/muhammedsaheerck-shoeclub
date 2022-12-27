import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';

import '../address/screen_address.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.inika(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: buttonColor,
          ),
        ),
        iconTheme: const IconThemeData(),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
      body: ListView(
        children: [
          Container(
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: ((context) {}),
                        icon: Icons.delete,
                        label: "Delete",
                      )
                    ]),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
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
                            height: MediaQuery.of(context).size.height * 0.15,
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
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder()),
                                          onPressed: (() {}),
                                          child: const Icon(Icons.add))
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 135),
                                    child: Text("1"),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("₹ 2500"),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder()),
                                          onPressed: (() {}),
                                          child: const Icon(Icons.add))
                                    ],
                                  ),
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
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "3 Items in Cart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Bag Total ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹ 2500 ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹ 5000 ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    height10,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(35),
                            elevation: 1,
                            backgroundColor:
                                const Color.fromRGBO(237, 91, 78, 1)),
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const ScreenAddress())));
                        }),
                        child: const Text("PLACE ORDER"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
