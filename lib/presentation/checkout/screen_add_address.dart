import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';

import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';

class ScreenAddAddress extends StatelessWidget {
  const ScreenAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'ADDRESS',
            style: GoogleFonts.inika(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: buttonColor,
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TextFieldWidget(
                  keybordtype: TextInputType.name, hint: "Name"),
              height10,
              const TextFieldWidget(
                  keybordtype: TextInputType.name, hint: "Adress"),
              height10,
              const TextFieldWidget(
                  keybordtype: TextInputType.name, hint: "Mobile"),
              height10,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35),
                        elevation: 1,
                        backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                    onPressed: (() {
                      Navigator.of(context).pop();
                    }),
                    child: const Text("SUBMIT")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
