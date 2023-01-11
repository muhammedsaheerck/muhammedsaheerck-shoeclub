import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'widgets/text_ittaliana.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ScreenSignIn()))));
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: test,
        body: Stack(
          children: [
            Image.asset("asset/splash.png",
                height: MediaQuery.of(context).size.height * 0.9),
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 90),
              child: TextItalianaWidget(
                name: 'Shoe Club',
                size: MediaQuery.of(context).size.height * 0.060,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.8, left: 10),
              child: TextItalianaWidget(
                  name: "Start Journey With \nShoe Club", size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
