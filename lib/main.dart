import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/application/auth/forgot_password_provider.dart';
import 'package:shoeclub/application/bottom_navigation_providder.dart';
import 'package:shoeclub/application/home/dropdown_filter_provider.dart';
import 'package:shoeclub/application/auth/login_provider.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';
import 'package:shoeclub/presentation/signup/widgets/screen_otp.dart';
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
        ChangeNotifierProvider(create: ((context) => DropdownFilterProvider())),
        ChangeNotifierProvider(create: ((context) => AddressProvider())),
        ChangeNotifierProvider(create: ((context) => LogInProvider())),
        ChangeNotifierProvider(create: ((context) => ForgotPassWord())),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'e-commerce (Shoe Club)',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: ScreenSplash(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
