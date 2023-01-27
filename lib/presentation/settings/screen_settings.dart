import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/presentation/settings/widgets/privacy_policy.dart';
import 'package:shoeclub/presentation/settings/widgets/screen_termsaandconditions.dart';

import 'package:shoeclub/presentation/splash/screen_splash.dart';

import 'widgets/screen_myorders.dart';

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
                        "Muhammed Saheer",
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
                const SizedBox(
                  height: 150,
                ),
                ListTile(
                  onTap: () =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ScreenMyOrders(),
                  )),
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => ScreenTermsAndConditions()),
                      ),
                    );
                  },
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const ScreenPrivacyPolicy()),
                      ),
                    );
                  },
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
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        context: context,
                        builder: (BuildContext ctx) {
                          return SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Theme.of(context).primaryColor,
                                        elevation: 3,
                                        shadowColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset(
                                          'asset/logo2.png',
                                          height: 60,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text('ShoeClub',
                                          style: GoogleFonts.italiana(
                                            textStyle: const TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text('Developed By Muhammed Saheer CK',
                                      style: GoogleFonts.inika(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    onPressed: (() {
                                      Navigator.pop(ctx);
                                    }),
                                    child: Text('Cancel',
                                        style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )))
                              ],
                            ),
                          );
                        });
                  },
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
                CoreDatas.instance.height20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: CoreDatas.instance.buttonStyle,
                      // OutlinedButton.styleFrom(
                      //     side:
                      //         const BorderSide(color: Colors.purple, width: 2)),
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
                      child: const Text(
                        "LOG OUT",
                        style: TextStyle(color: Colors.white),
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
