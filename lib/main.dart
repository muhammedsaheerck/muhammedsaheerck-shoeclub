import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/application/auth/auth_provider.dart';
import 'package:shoeclub/application/auth/forgot_password_provider.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/cart/checkout_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/application/settings/settings_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/presentation/splash/screen_splash.dart';
import 'core/core_datas.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: CoreDatas.instance.buttonColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => HomeProvider())),
        ChangeNotifierProvider(create: ((context) => AddressProvider())),
        ChangeNotifierProvider(create: ((context) => ForgotPassWord())),
        ChangeNotifierProvider(create: ((context) => WhishListProvider())),
        ChangeNotifierProvider(create: ((context) => CartProvider())),
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
        ChangeNotifierProvider(create: ((context) => CheckoutProvider())),
        ChangeNotifierProvider(create: ((context) => OrderProvider())),
        ChangeNotifierProvider(create: ((context) => SettingsProvider())),
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
