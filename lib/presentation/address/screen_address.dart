import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/address/screen_add_address.dart';

import '../../core/color.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColorPlatinum,
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your Address to Deliver\nYour Product",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            height30,
            Container(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.separated(
                separatorBuilder: (context, index) => height10,
                itemCount: 2,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: cardColorAlilceBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Muhammed Saheer ck",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Consumer<AddressProvider>(
                                builder: (context, valueProvider, child) =>
                                    Checkbox(
                                        value: valueProvider.check,
                                        onChanged: ((value) {
                                          valueProvider.checkBoxChange(value!);
                                        })))
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(35),
                          elevation: 1,
                          backgroundColor:
                              const Color.fromRGBO(237, 91, 78, 1)),
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const ScreenAddAddress())));
                      }),
                      child: const Text("ADD ADDRESS")),
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
                      child: const Text("PAY NOW")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
