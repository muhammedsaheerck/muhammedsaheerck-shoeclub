import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

Color buttonColor = const Color.fromRGBO(18, 27, 40, 1);
Color splashColorPlatinum = Color.fromARGB(255, 251, 248, 248);
Color cardColorAlilceBluedark = const Color.fromARGB(255, 200, 199, 199);
Color cardColorAlilceBlue = const Color.fromARGB(255, 234, 232, 232);
Color backgroundColor = Color.fromARGB(255, 203, 219, 238);
Color buttonColor2 = const Color.fromRGBO(237, 91, 78, 1);

Color test = const Color.fromARGB(255, 241, 239, 247);

ButtonStyle buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
  ),
);
