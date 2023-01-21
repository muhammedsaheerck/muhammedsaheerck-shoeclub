import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';

import '../domain/modal/product/product_modal.dart';
import '../domain/modal/whishlist/wishlist_modal.dart';

//colors
Color buttonColor = const Color.fromRGBO(18, 27, 40, 1);
Color splashColorPlatinum = Color.fromARGB(255, 251, 248, 248);
Color cardColorAlilceBluedark = const Color.fromARGB(255, 200, 199, 199);
Color cardColorAlilceBlue = const Color.fromARGB(255, 234, 232, 232);
Color backgroundColor = Color.fromARGB(255, 203, 219, 238);
Color headMainColor = const Color.fromARGB(255, 141, 91, 226);

Color test = const Color.fromARGB(255, 241, 239, 247);

//styles
ButtonStyle buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
  ),
);

//sizes
SizedBox height5 = const SizedBox(
  height: 5,
);

SizedBox height10 = const SizedBox(
  height: 10,
);
SizedBox height20 = const SizedBox(
  height: 20,
);
SizedBox height30 = const SizedBox(
  height: 30,
);
Divider divider1 = const Divider(
  thickness: 1,
);
Divider divider2 = const Divider(
  color: Colors.deepPurple,
  thickness: 2,
);
SizedBox width10 = const SizedBox(
  width: 10,
);

//key
const userKey = "UserId";
String? userId;

//valuenotifiers
ValueNotifier<List<ProductElementCart?>> cartNotifierList = ValueNotifier([]);
ValueNotifier<int> totalAmount = ValueNotifier(0);
ValueNotifier<List<ProductElement?>> wishlistnotifier = ValueNotifier([]);
ValueNotifier<List<Product?>> valueFound = ValueNotifier([]);
ValueNotifier<int?> totalQty = ValueNotifier(0);
ValueNotifier<List<AddressElements?>> addressListNotifier = ValueNotifier([]);

//athors

