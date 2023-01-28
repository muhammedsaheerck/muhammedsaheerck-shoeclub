import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/application/settings/settings_provider.dart';

import 'package:shoeclub/core/core_datas.dart';
import 'package:shoeclub/presentation/settings/widgets/privacy_policy.dart';
import 'package:shoeclub/presentation/settings/widgets/screen_termsaandconditions.dart';

import 'package:shoeclub/presentation/splash/screen_splash.dart';

import '../../infrastructure/order/order_services.dart';
import 'orders/screen_myorders.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await OrdersApiCall().getAllOrders(context);
    });
    log("userNam-----------${CoreDatas.instance.userName}");
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: CoreDatas.instance.test,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade100,
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
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        CoreDatas.instance.userName!,
                        style: GoogleFonts.inika(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.35,
                      vertical: MediaQuery.of(context).size.height * 0.03),
                  child: CircleAvatar(
                    backgroundColor: CoreDatas.instance.test,
                    radius: 70,
                    child: Image.asset(
                      "asset/user (1).png",
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
            Flexible(
                child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
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
