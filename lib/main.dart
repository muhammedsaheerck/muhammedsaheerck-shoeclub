import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/aProduct/aproduct_provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/application/auth/forgot_password_provider.dart';
import 'package:shoeclub/application/bottom_navigation_providder.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/product/product_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/splash/screen_splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: buttonColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: ((context) => BottomNavigationProvider())),
        ChangeNotifierProvider(create: ((context) => HomeProvider())),
        ChangeNotifierProvider(create: ((context) => AddressProvider())),
        ChangeNotifierProvider(create: ((context) => ForgotPassWord())),
        ChangeNotifierProvider(create: ((context) => ProductProvider())),
        ChangeNotifierProvider(create: ((context) => WhishListProvider())),
        ChangeNotifierProvider(create: ((context) => AProductProvider())),
        ChangeNotifierProvider(create: ((context) => CartProvider())),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'e-commerce (Shoe Club)',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: const ScreenSplash(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
