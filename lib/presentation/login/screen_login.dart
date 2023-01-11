import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/auth/login_provider.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/login/widgets/screen_forgot_password.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: test,
      body: SafeArea(
        // backgroundColor: splashColorPlatinum,
        child: ListView(
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
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 10,
                    horizontal: MediaQuery.of(context).size.height / 80),
                child: Consumer<LogInProvider>(
                  builder: (context, valueProvider, child) => Form(
                    key: valueProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: valueProvider.signInEmailCOntroller,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Please fill the email field";
                            }
                          }),
                          cursorColor: buttonColor,
                          decoration: InputDecoration(
                            focusColor: Colors.deepPurple,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "User Email",
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        height10,
                        TextFormField(
                          controller: valueProvider.signInPasswordCOntroller,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Please fill the password field";
                            }
                          }),
                          cursorColor: buttonColor,
                          decoration: InputDecoration(
                            focusColor: Colors.deepPurple,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "User Password",
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height / 4),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ScreenForgotPassword())));
                              },
                              child: const Text(
                                "Forgotten password",
                                style: TextStyle(fontSize: 15),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 5),
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: (() {
                                valueProvider.logInUser(context);
                              }),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'SignIn',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              // style: ButtonStyle(
                              //     // fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                              //     backgroundColor:
                              //         MaterialStateProperty.all(buttonColor),
                              //     shape: MaterialStateProperty.all<
                              //             RoundedRectangleBorder>(
                              //         RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(18.0),
                              //     ))),
                              // child: const Text("Sign In"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height / 10,
                              vertical:
                                  MediaQuery.of(context).size.height / 20),
                          child: Row(
                            children: [
                              const Text(
                                "Don't have a account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ScreenSignUp())));
                                  },
                                  child: const Text("Sign Up"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), // const FormCustomWidget(),
              height10,

              // Padding(
              //   padding: const EdgeInsets.only(top: 140),
              //   child: Stack(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 150, top: 80),
              //         child: Container(
              //             height: 60,
              //             width: 100,
              //             decoration: const BoxDecoration(
              //                 borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(40),
              //                     topRight: Radius.circular(100)),
              //                 color: Color.fromRGBO(186, 162, 135, 1))),
              //       ),
              //       Container(
              //           height: 140,
              //           width: 200,
              //           decoration: const BoxDecoration(
              //               borderRadius: BorderRadius.only(
              //                   topRight: Radius.elliptical(500, 400)),
              //               color: Color.fromRGBO(124, 133, 132, 1))),
              //     ],
              //   ),
              // )
            ]),
      ),
    );
  }
}
