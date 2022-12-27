import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetInikaFont extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  const TextWidgetInikaFont(
      {Key? key,
      required this.fontWeight,
      required this.size,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inika(
          textStyle: TextStyle(
              fontSize: size, fontWeight: fontWeight, letterSpacing: 0)),
    );
  }
}
