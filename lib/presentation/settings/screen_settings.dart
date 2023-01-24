import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/application/auth/auth_provider.dart';

import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/presentation/settings/widgets/about.dart';

import 'package:shoeclub/presentation/splash/screen_splash.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: CoreDatas.instance.test,
        appBar: AppBar(
          backgroundColor: CoreDatas.instance.headMainColor,
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
                      color: CoreDatas.instance.headMainColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(160),
                          bottomRight: Radius.circular(160))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "value.nameUser!",
                        style: GoogleFonts.inika(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: CircleAvatar(
                    backgroundColor: CoreDatas.instance.test,
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
                  iconColor: CoreDatas.instance.buttonColor,
                  leading: const Icon(
                    Icons.location_city,
                    size: 25,
                  ),
                  title: const Text(
                    "My Order",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                CoreDatas.instance.divider1,
                ListTile(
                  iconColor: CoreDatas.instance.buttonColor,
                  leading: Image.asset(
                    "asset/terms-and-conditions.png",
                    height: 25,
                  ),
                  title: const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                CoreDatas.instance.divider1,
                ListTile(
                  iconColor: CoreDatas.instance.buttonColor,
                  leading: const Icon(
                    Icons.privacy_tip,
                    size: 25,
                  ),
                  title: const Text(
                    "Privacy & Policy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                CoreDatas.instance.divider1,
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: ((context) => const ScreenAbout())),
                  ),
                  iconColor: CoreDatas.instance.buttonColor,
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
                          side: BorderSide(color: Colors.purple, width: 2)),
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
                        style: TextStyle(color: CoreDatas.instance.buttonColor),
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
