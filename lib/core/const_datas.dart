import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/application/home/home_provider.dart';

//colors
Color buttonColor = const Color.fromRGBO(18, 27, 40, 1);
Color splashColorPlatinum = Color.fromARGB(255, 251, 248, 248);
Color cardColorAlilceBluedark = const Color.fromARGB(255, 200, 199, 199);
Color cardColorAlilceBlue = const Color.fromARGB(255, 234, 232, 232);
Color backgroundColor = Color.fromARGB(255, 203, 219, 238);
Color buttonColor2 = const Color.fromRGBO(237, 91, 78, 1);

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
SizedBox width10 = const SizedBox(
  width: 10,
);

//key
const userKey = "UserId";
String? userId;