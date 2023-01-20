import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/bottom_navigation_providder.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/wishlist/screen_wishlist.dart';

import '../../application/cart/cart_provider.dart';
import '../cart/screen_cart.dart';
import '../settings/screen_settings.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  final List<Widget> tabItems = const [
    ScreenHome(),
    ScreenCart(),
    ScreenWhishlist(),
    ScreenSettings()
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
                Icons.shopping_bag,
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
