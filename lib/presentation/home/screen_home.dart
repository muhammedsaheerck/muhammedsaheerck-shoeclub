import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/product_details/product_details.dart';
import 'package:shoeclub/presentation/splash/widgets/text_ittaliana.dart';

import 'widgets/dropdownn_filter_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
          leadingWidth: 100,
          backgroundColor: splashColorPlatinum,
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
        backgroundColor: splashColorPlatinum,
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
                  margin: EdgeInsets.only(left: 2, right: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: buttonColor2,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownFilter(),
                  width: MediaQuery.of(context).size.width * 0.13),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: ((context, index) {
                  return Card(
                    color: cardColorAlilceBlue,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.11,
                          // color: Colors.amber,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const ScreenProductDetails())));
                            },
                            child: Image.asset(
                              "asset/product1.png", fit: BoxFit.fill,
                              // width: double.infinity,
                              // height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          ),
                        ),
                        const Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nike",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border))
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Text("₹ 2500"),
                        ),
                      ],
                    ),
                  );
                })),
          )
        ]),
      ),
    );
  }
}
