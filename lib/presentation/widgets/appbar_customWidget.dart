import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/core_datas.dart';

class AppBarCustomWidget extends StatelessWidget {
  final String appBarName;
  const AppBarCustomWidget({
    required this.appBarName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        appBarName,
        style: GoogleFonts.inika(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: CoreDatas.instance.buttonColor,
        ),
      ),
      iconTheme: const IconThemeData(),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          )),
    );
  }
}
