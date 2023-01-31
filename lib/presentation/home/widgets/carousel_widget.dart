import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    );
  }
}
