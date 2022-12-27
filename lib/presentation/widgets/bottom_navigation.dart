import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/bottom_navigation_providder.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';
import 'package:shoeclub/presentation/whishlist/screen_whishlist.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  final List<Widget> tabItems = const [
    ScreenHome(),
    ScreenSignIn(),
    ScreenSignUp(),
    ScreenWhishlist(),
    ScreenSignIn()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, value, child) => Scaffold(
        body: tabItems[value.selectedIndex],
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.bounceIn,
          selectedIndex: value.selectedIndex,
          backgroundColor: buttonColor,
          showElevation: true,
          onItemSelected: (index) {
            value.tabBarChange(index);
          },
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.home,
                color: splashColorPlatinum,
                size: 30,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: splashColorPlatinum, fontSize: 17),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.search,
                color: splashColorPlatinum,
                size: 30,
              ),
              title: Text('Search',
                  style: TextStyle(color: splashColorPlatinum, fontSize: 17)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: splashColorPlatinum,
                size: 30,
              ),
              title: Text('Cart',
                  style: TextStyle(color: splashColorPlatinum, fontSize: 17)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.favorite,
                color: splashColorPlatinum,
                size: 30,
              ),
              title: Text('Favorite',
                  style: TextStyle(color: splashColorPlatinum, fontSize: 17)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.person,
                color: splashColorPlatinum,
                size: 30,
              ),
              title: Text('Account',
                  style: TextStyle(color: splashColorPlatinum, fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}
