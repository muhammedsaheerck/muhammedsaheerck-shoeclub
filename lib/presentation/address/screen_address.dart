import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/sizes.dart';

import '../../core/color.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ADDRESS',
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
      body: Container(
        height: 220,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Muhammed Saheer ck",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "Hilit Business Park",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const Text(
                "Kozhikkode",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const Text(
                "1234567898",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              height10,
               height10,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(35),
                      elevation: 1,
                      backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                  onPressed: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const ScreenAddress())));
                  }),
                  child: const Text("ADD ADDRESS"))
            ],
          ),
        ),
      ),
      
    );
  }
}
