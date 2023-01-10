import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';
import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});

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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Sign In to continue',
                  style: GoogleFonts.inika(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0)),
                ),
              ),
              height10,
              Padding(
                padding: EdgeInsets.only(left: 10, top: 40, right: 10),
                child: TextFormField(
                  validator: ((value) {}),
                  cursorColor: buttonColor,
                  decoration: InputDecoration(
                    focusColor: buttonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "User Name",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: TextFormField(
                  validator: ((value) {}),
                  cursorColor: buttonColor,
                  decoration: InputDecoration(
                    focusColor: buttonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "User Name",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),

              // const FormCustomWidget(),
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
                  child: const Text("Sign In"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 30),
                child: Row(
                  children: [
                    const Text("Don't have a account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => ScreenSignUp())));
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 150, top: 80),
                      child: Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(100)),
                              color: Color.fromRGBO(186, 162, 135, 1))),
                    ),
                    Container(
                        height: 140,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(500, 400)),
                            color: Color.fromRGBO(124, 133, 132, 1))),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
