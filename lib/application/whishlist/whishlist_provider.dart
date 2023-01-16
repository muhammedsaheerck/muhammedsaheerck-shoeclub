import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../core/const_datas.dart';

class WhishListProvider extends ChangeNotifier {
  void addWhishList(bool? click, int index) {
    if (click == true) {
      wishlistnotifier.value.remove(productListNotifier.value[index]);
      wishlistnotifier.notifyListeners();
    } else {
      wishlistnotifier.value.add(productListNotifier.value[index]);
      wishlistnotifier.notifyListeners();
    }
    notifyListeners();
  }

  void userIdGet(String id) {
    userId = id;
    log(userId.toString());
    notifyListeners();
  }
}
