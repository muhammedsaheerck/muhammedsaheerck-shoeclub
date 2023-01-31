import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';
import 'package:shoeclub/presentation/wishlist/screen_wishlist.dart';
import '../../core/core_datas.dart';
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
    return Consumer<HomeProvider>(
      builder: (context, value, child) => Scaffold(
        body: tabItems[value.selectedIndex],
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.bounceIn,
          selectedIndex: value.selectedIndex,
          backgroundColor: CoreDatas.instance.buttonColor,
          showElevation: true,
          onItemSelected: (index) {
            value.tabBarChange(index);
          },
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.home,
                color: CoreDatas.instance.splashColorPlatinum,
                size: 30,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: CoreDatas.instance.splashColorPlatinum,
                    fontSize: 17),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.shopping_bag,
                color: CoreDatas.instance.splashColorPlatinum,
                size: 30,
              ),
              title: Text('Cart',
                  style: TextStyle(
                      color: CoreDatas.instance.splashColorPlatinum,
                      fontSize: 17)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.favorite,
                color: CoreDatas.instance.splashColorPlatinum,
                size: 30,
              ),
              title: Text('Favorite',
                  style: TextStyle(
                      color: CoreDatas.instance.splashColorPlatinum,
                      fontSize: 17)),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.person,
                color: CoreDatas.instance.splashColorPlatinum,
                size: 30,
              ),
              title: Text('Account',
                  style: TextStyle(
                      color: CoreDatas.instance.splashColorPlatinum,
                      fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}
