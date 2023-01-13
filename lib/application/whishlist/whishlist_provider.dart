import 'package:flutter/cupertino.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';

class WhishListProvider extends ChangeNotifier {
  String? userId;
  void addWhishList(bool? click, int index) {
    if (click == true) {
      wishlistnotifier.value.remove(productListNotifier.value[index]);
      notifyListeners();
    } else {
      wishlistnotifier.value.add(productListNotifier.value[index]);
      notifyListeners();
    }
    notifyListeners();
  }

  void userIdGet(String id) {
    userId = id;
    notifyListeners();
  }
}
