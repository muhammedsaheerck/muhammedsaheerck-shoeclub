import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/const_datas.dart';

class TextItalianaWidget extends StatelessWidget {
  String name;
  double size;
  TextItalianaWidget({Key? key, required this.name, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.italiana(
          textStyle: TextStyle(
              fontSize: size, fontWeight: FontWeight.w900, color: buttonColor)),
    );
  }
}
