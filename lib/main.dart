import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/bottom_navigation_providder.dart';
import 'package:shoeclub/application/home/dropdown_filter_provider.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/splash/screen_splash.dart';

import 'presentation/widgets/bottom_navigation.dart';

void main() {
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
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'e-commerce (Shoe Club)',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: BottomNavigationBarWidget(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
