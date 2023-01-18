import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../../core/const_datas.dart';

class WhishListProvider extends ChangeNotifier {
  void userIdGet(String id) {
    userId = id;
    log(userId.toString());
    notifyListeners();
  }
}
