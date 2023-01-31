import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/core_datas.dart';

class TextItalianaWidget extends StatelessWidget {
  final String name;
  final double size;
  const TextItalianaWidget({Key? key, required this.name, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.italiana(
          textStyle: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w900,
              color: CoreDatas.instance.buttonColor)),
    );
  }
}
