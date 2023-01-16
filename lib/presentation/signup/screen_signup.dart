import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/infrastructure/auth/auth_services.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/signup/widgets/screen_otp.dart';
import '../widgets/text_widget_inikafont.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({
    super.key,
  });

  final signupNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: splashColorPlatinum,
      backgroundColor: test,
      body: SafeArea(
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
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextWidgetInikaFont(
                  text: 'Sign up to continue',
                  fontWeight: FontWeight.w200,
                  size: 30,
                ),
              ),
              // FormCustomWidget(),
              height30,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 80),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: signupNameController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            } else if (signupNameController.text.length < 4) {
                              return "Please enter minimum four charecter";
                            }
                            return null;
                          }),
                          cursorColor: buttonColor,
                          decoration: InputDecoration(
                            // fillColor: const Color.fromRGBO(222, 219, 219, 1),
                            focusColor: Colors.deepPurple,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "User Name",
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        height10,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: signupEmailController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Emile";
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(signupEmailController.text)) {
                              return 'Incorrect email';
                            }
                            return null;
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
                            hintText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        height10,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: signupPasswordController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            }
                            return null;
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
                            hintText: "Password",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        height10,
                        TextFormField(
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: signupConfirmPasswordController,
                          validator: ((value) {
                            if (signupPasswordController.text !=
                                signupConfirmPasswordController.text) {
                              return "You'r entered incorrect password";
                            } else if (value!.isEmpty) {
                              return "Please fill the confirm password";
                            }
                            return null;
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
                            hintText: "Confirm Password",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )),
              ),
              height30,
              Padding(
                padding: const EdgeInsets.only(left: 170, right: 30),
                child: ElevatedButton(
                  onPressed: (() {
                    log("message");
                    signUpUser(context);
                    log("qqqqq");
                  }),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    const Text(
                      "Already have a account?",
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
                              builder: ((context) => ScreenSignIn()),
                            ),
                          );
                        },
                        child: const Text("Sign In"))
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Future signUpUser(context) async {
    try {
      log(signupNameController.text);
      log(signupEmailController.text);
      log(signupPasswordController.text);
      log(signupConfirmPasswordController.text);
      if (signupNameController.text.isEmpty &&
          signupEmailController.text.isEmpty &&
          signupPasswordController.text.isEmpty &&
          signupConfirmPasswordController.text.isEmpty &&
          signupPasswordController.text !=
              signupConfirmPasswordController.text) {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text('Please add all fields')),
        );
      }
      // else {
      //   Response? response = await AuthApiCall.instance.userAlreadySigned(
      //     signupEmailController.text,
      //   );
      //   log(response!.data.toString());
      //   log(response.statusCode.toString());
      //   if (response.statusCode == 200) {
      //     return ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //           content: Text('User already exist, Change Your email')),
      //     );
      //   }
      else {
        AuthApiCall().sendOtp(signupEmailController.text);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => ScreenOtp(
                  email: signupEmailController.text,
                  pass: signupPasswordController.text,
                  name: signupNameController.text,
                )),
          ),
        );
      }
      // }
    } catch (e) {
      log(e.toString());
    }
  }
}
