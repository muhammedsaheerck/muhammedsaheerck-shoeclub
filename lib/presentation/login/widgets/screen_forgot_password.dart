import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/auth/forgot_password_provider.dart';
import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';
import '../../../core/core_datas.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ForgotPassWord>(
            builder: (context, valueProvider, child) => ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 10,
                      vertical: MediaQuery.of(context).size.height / 15),
                  child: Text(
                    'New Password',
                    style: GoogleFonts.inika(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        keybordtype: TextInputType.name,
                        hint: "User Email",
                        controller: valueProvider.forgotEmailCOntroller,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Emile";
                          } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(
                                  valueProvider.forgotEmailCOntroller.text)) {
                            return 'Incorrect email';
                          }
                          return null;
                        }),
                      ),
                      CoreDatas.instance.height20,
                      TextFieldWidget(
                        keybordtype: TextInputType.name,
                        hint: "New Password",
                        controller: valueProvider.forgotPasswordCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter the New password";
                          }
                          return null;
                        }),
                      ),
                      CoreDatas.instance.height20,
                      TextFieldWidget(
                        keybordtype: TextInputType.name,
                        hint: "Confirm Password",
                        controller:
                            valueProvider.forgotConfirmPasswordCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty ||
                              valueProvider.forgotPasswordCOntroller.text !=
                                  valueProvider
                                      .forgotConfirmPasswordCOntroller.text) {
                            return "Incorrect password ";
                          }
                          return null;
                        }),
                      ),
                    ],
                  ),
                ),
                CoreDatas.instance.height30,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      log("aaaaa");
                      valueProvider.changePassword(context, formKey);
                    },
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
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
