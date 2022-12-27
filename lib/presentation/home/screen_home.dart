import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/splash/widgets/text_ittaliana.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        body: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/logo2.png",
                height: 100,
                width: 100,
                fit: BoxFit.fill,
                color: Colors.black,
              ),
              TextItalianaWidget(
                name: "Shoe Club",
                size: MediaQuery.of(context).size.height * 0.050,
              )
            ],
          ),
          height10,
          CarouselSlider(
            options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1)),
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
                      margin: const EdgeInsets.symmetric(horizontal: 1.0),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: i);
                },
              );
            }).toList(),
          ),
          height10,
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
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
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: ((context, index) {
                  return Card(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          color: Colors.amber,
                          width: double.infinity,
                          child: Image.asset(
                            "asset/splash.png", fit: BoxFit.fill,
                            // width: double.infinity,
                            // height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Nike",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.favorite)
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("₹ 2500"),
                        ),
                      ],
                    ),
                  );
                  // return Column(
                  //   children: [
                  //     Container(
                  //       child: Icon(Icons.person,
                  //           size: 24, color: Colors.blueAccent),
                  //       padding: const EdgeInsets.all(12),
                  //     ),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //           color: Colors.blueAccent,
                  //           borderRadius: BorderRadius.only(
                  //               bottomRight: Radius.circular(12),
                  //               bottomLeft: Radius.circular(12))),
                  //       child: Text("Student"),
                  //       padding: const EdgeInsets.all(12),
                  //     )
                  //   ],
                  // );
                })),
          )
        ]),
      ),
    );
  }
}
