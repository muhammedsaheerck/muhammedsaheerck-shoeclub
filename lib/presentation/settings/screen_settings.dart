import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/core/const_datas.dart';

import 'package:shoeclub/presentation/splash/screen_splash.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: test,
        appBar: AppBar(
          backgroundColor: buttonColor2,
          elevation: 0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: buttonColor2,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(160),
                          bottomRight: Radius.circular(160))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: Text(
                      'Muhammed Saheer Ck',
                      style: GoogleFonts.inika(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: buttonColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: CircleAvatar(
                    backgroundColor: test,
                    radius: 60,
                    child: Image.asset(
                      "asset/user (1).png",
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            Flexible(
                child: ListView(
              children: [
                ListTile(
                  iconColor: buttonColor,
                  leading: const Icon(Icons.person, size: 25),
                  title: const Text(
                    "Muhammed Sheer Ck",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                divider1,
                ListTile(
                  iconColor: buttonColor,
                  leading: const Icon(
                    Icons.location_city,
                    size: 25,
                  ),
                  title: const Text(
                    "My Order",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                divider1,
                ListTile(
                  iconColor: buttonColor,
                  leading: Image.asset(
                    "asset/terms-and-conditions.png",
                    height: 25,
                  ),
                  title: const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                divider1,
                ListTile(
                  iconColor: buttonColor,
                  leading: const Icon(
                    Icons.privacy_tip,
                    size: 25,
                  ),
                  title: const Text(
                    "Privacy & Policy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                divider1,
                ListTile(
                  iconColor: buttonColor,
                  leading: Image.asset(
                    "asset/information-button.png",
                    height: 25,
                  ),
                  title: const Text(
                    "About",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: buttonColor2, width: 2)),
                      onPressed: (() async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove("isSignIn");
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: ((context) => const ScreenSplash()),
                            ),
                            (route) => false);
                      }),
                      child: Text(
                        "LOG OUT",
                        style: TextStyle(color: buttonColor),
                      )),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
