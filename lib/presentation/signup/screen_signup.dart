import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/auth/auth_provider.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';
import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';
import '../../core/core_datas.dart';
import '../widgets/text_widget_inikafont.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreDatas.instance.test,
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              "Welcome !",
              style: GoogleFonts.ingridDarling(
                textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
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
          CoreDatas.instance.height30,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 80),
            child: Form(
                key: _formKey,
                child: Consumer<AuthProvider>(
                  builder: (context, valueProvider, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        keybordtype: TextInputType.name,
                        hint: "User Name",
                        controller: valueProvider.signupNameController,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          } else if (valueProvider
                                  .signupNameController.text.length <
                              4) {
                            return "Please enter minimum four charecter";
                          }
                          return null;
                        }),
                      ),
                      CoreDatas.instance.height10,
                      TextFieldWidget(
                        keybordtype: TextInputType.emailAddress,
                        hint: "Email",
                        controller: valueProvider.signupEmailController,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Emile";
                          } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(
                                  valueProvider.signupEmailController.text)) {
                            return 'Incorrect email';
                          }
                          return null;
                        }),
                      ),
                      CoreDatas.instance.height10,
                      TextFieldWidget(
                        keybordtype: TextInputType.number,
                        hint: "Password",
                        controller: valueProvider.signupPasswordController,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password";
                          }
                          return null;
                        }),
                      ),
                      CoreDatas.instance.height10,
                      TextFieldWidget(
                        keybordtype: TextInputType.number,
                        hint: "Confirm Password",
                        controller:
                            valueProvider.signupConfirmPasswordController,
                        validator: ((value) {
                          if (valueProvider.signupPasswordController.text !=
                              valueProvider
                                  .signupConfirmPasswordController.text) {
                            return "You'r entered incorrect password";
                          } else if (value!.isEmpty) {
                            return "Please fill the confirm password";
                          }
                          return null;
                        }),
                      ),
                    ],
                  ),
                )),
          ),
          CoreDatas.instance.height30,
          Padding(
            padding: const EdgeInsets.only(left: 170, right: 30),
            child: Consumer<AuthProvider>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: (() {
                  log("message");
                  value.signUpUser(context);
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
}
