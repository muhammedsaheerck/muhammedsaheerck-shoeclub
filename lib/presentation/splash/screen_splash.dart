import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/application/home/home_provider.dart';

import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';
import '../../core/core_datas.dart';
import '../../infrastructure/product/product_services.dart';
import 'widgets/text_ittaliana.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    alreadySigned();
    ProductApiCalls().getProducts(context);
    // Provider.of<HomeProvider>(context, listen: false).dropdownShowProducts(0);
    valueFound.value = productListNotifier.value;
    super.initState();
  }

  bool isSignedIn = false;
  Future alreadySigned() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedUser = preferences.getBool("isSignIn");
    setState(() {
      isSignedIn = obtainedUser ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => isSignedIn == false
                ? ScreenSignIn()
                : BottomNavigationBarWidget()))));
    return SafeArea(
      child: Scaffold(
        // backgroundColor: splashColorPlatinum,
        backgroundColor: CoreDatas.instance.test,
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
