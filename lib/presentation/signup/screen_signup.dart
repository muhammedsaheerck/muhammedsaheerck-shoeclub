import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import '../widgets/text_widget_inikafont.dart';
import 'widgets/form_widget.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Text(
                  "Welcome !",
                  style: GoogleFonts.ingridDarling(
                      textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextWidgetInikaFont(
                  text: 'Sign up to continue',
                  fontWeight: FontWeight.w200,
                  size: 30,
                ),
              ),
              const FormCustomWidget(),
              height10,
              Padding(
                padding: const EdgeInsets.only(left: 170, right: 30),
                child: ElevatedButton(
                  onPressed: (() {}),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                      backgroundColor: MaterialStateProperty.all(buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: const Text("Sign Up"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    const Text("Already have a account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const ScreenSignIn())));
                        },
                        child: const Text("Sign In"))
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 120),
                    child: Container(
                        height: 60,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(100)),
                            color: Color.fromRGBO(186, 162, 135, 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                        height: 140,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(500, 400)),
                            color: Color.fromRGBO(124, 133, 132, 1))),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
