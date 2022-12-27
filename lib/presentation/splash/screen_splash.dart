import 'package:flutter/material.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';
import 'widgets/text_ittaliana.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        body: Stack(
          children: [
            Image.asset(
              "asset/splash.png",
              height: MediaQuery.of(context).size.height*0.9
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 90),
              child: TextItalianaWidget(
                name: 'Shoe Club',
                size: MediaQuery.of(context).size.height*0.060,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextItalianaWidget(
                      name: "Start Journey With \nShoe Club", size: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: buttonColor,
                    child: IconButton(
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const ScreenSignUp())));
                        }),
                        icon: const Icon(Icons.arrow_forward_ios)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
